#!/usr/bin/env python3
import os
import sys
import struct
import gzip
import shutil
import zipfile
import subprocess
import hashlib

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUTPUT_DIR = os.path.join(BASE_DIR, "output")
ANYKERNEL_SRC = os.path.join(BASE_DIR, "neolit_inspect")
RAW_KERNEL_PATH = "/tmp/rom_kernel.raw"
DTB_PATH = "/tmp/rom_dtb.raw"
RAMDISK_PATH = "/tmp/rom_ramdisk.raw"

os.makedirs(OUTPUT_DIR, exist_ok=True)

# Target configurations: (Hz, data_rate_mbps, is_stock)
PROFILES = [
    (60, 733, True),
    (64, 782, False),
    (65, 794, False),
    (66, 807, False),
    (67, 819, False),
    (68, 831, False),
    (69, 843, False),
    (70, 856, False),
]

def md5_file(filepath):
    h = hashlib.md5()
    with open(filepath, "rb") as f:
        while chunk := f.read(65536):
            h.update(chunk)
    return h.hexdigest()

def sha256_file(filepath):
    h = hashlib.sha256()
    with open(filepath, "rb") as f:
        while chunk := f.read(65536):
            h.update(chunk)
    return h.hexdigest()

def main():
    print("=== Realme Narzo 30A (RMX3171) Display Overclock Generator ===")
    
    with open(RAW_KERNEL_PATH, "rb") as f:
        base_kernel = bytearray(f.read())
    with open(DTB_PATH, "rb") as f:
        dtb_data = f.read()
    with open(RAMDISK_PATH, "rb") as f:
        ramdisk_data = f.read()

    print(f"Base kernel size: {len(base_kernel)} bytes")
    print(f"DTB size: {len(dtb_data)} bytes")
    print(f"Ramdisk size: {len(ramdisk_data)} bytes")

    # Verify offset 0x8b3d50 has ret stub (c0 03 5f d6)
    ret_stub = struct.pack("<I", 0xd65f03c0)
    base_kernel[0x8b3d50:0x8b3d54] = ret_stub

    results = []

    for hz, rate, is_stock in PROFILES:
        print(f"\n--- Generating {hz} Hz Profile (Data Rate: {rate} Mbps) ---")
        
        # 1. Patch rate opcode at 0x865044
        # mov w9, #<rate> -> 0x52800000 | (rate << 5) | 9
        patched_kernel = bytearray(base_kernel)
        rate_opcode = 0x52800000 | (rate << 5) | 9
        patched_kernel[0x865044:0x865048] = struct.pack("<I", rate_opcode)

        # 2. Compress kernel with gzip level 9
        kgz = gzip.compress(patched_kernel, compresslevel=9)
        image_gz_dtb = kgz + dtb_data

        # 3. Create standalone boot.img
        temp_k_path = f"/tmp/k_{hz}.gz-dtb"
        with open(temp_k_path, "wb") as f:
            f.write(image_gz_dtb)

        boot_name = f"boot_rmx3171_{hz}hz_stock.img" if is_stock else f"boot_rmx3171_{hz}hz.img"
        boot_out_path = os.path.join(OUTPUT_DIR, boot_name)
        
        mkboot_cmd = [
            "mkbootimg",
            "--kernel", temp_k_path,
            "--ramdisk", RAMDISK_PATH,
            "--dtb", DTB_PATH,
            "--base", "0x40000000",
            "--kernel_offset", "0x00080000",
            "--ramdisk_offset", "0x07c80000",
            "--tags_offset", "0x0bc80000",
            "--dtb_offset", "0x0bc80000",
            "--os_version", "10.0.0",
            "--os_patch_level", "2026-04",
            "--header_version", "2",
            "--cmdline", "bootopt=64S3,32N2,64N2 buildvariant=user androidboot.selinux=permissive",
            "--pagesize", "2048",
            "-o", boot_out_path
        ]
        subprocess.run(mkboot_cmd, check=True)

        # Pad boot.img to 32MB (33,554,432 bytes)
        target_boot_size = 33554432
        curr_boot_size = os.path.getsize(boot_out_path)
        if curr_boot_size < target_boot_size:
            with open(boot_out_path, "ab") as f:
                f.write(b"\x00" * (target_boot_size - curr_boot_size))
        print(f"Generated standalone boot: {boot_name} ({os.path.getsize(boot_out_path)} bytes)")

        # 4. Create AnyKernel3 Flashable ZIP
        zip_name = f"RMX3171_Display_Stock_60Hz_Restore.zip" if is_stock else f"RMX3171_Display_OC_{hz}Hz.zip"
        zip_out_path = os.path.join(OUTPUT_DIR, zip_name)
        
        stage_dir = f"/tmp/ak3_stage_{hz}"
        if os.path.exists(stage_dir):
            shutil.rmtree(stage_dir)
        os.makedirs(stage_dir, exist_ok=True)

        # Copy AnyKernel tools & META-INF
        shutil.copytree(os.path.join(ANYKERNEL_SRC, "tools"), os.path.join(stage_dir, "tools"))
        shutil.copytree(os.path.join(ANYKERNEL_SRC, "META-INF"), os.path.join(stage_dir, "META-INF"))
        shutil.copy(os.path.join(ANYKERNEL_SRC, "LICENSE"), os.path.join(stage_dir, "LICENSE"))

        # Write Image.gz-dtb
        shutil.copy(temp_k_path, os.path.join(stage_dir, "Image.gz-dtb"))

        # Write customized anykernel.sh
        anykernel_sh_content = f"""# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {{ '
kernel.string=Realme Narzo 30A (RMX3171) Display Overclock - {hz}Hz
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=RMX3171
device.name2=rmx3171
device.name3=RMX3172
device.name4=rmx3172
device.name5=RMX2020
device.name6=rmx2020
device.name7=RMX2027
device.name8=rmx2027
device.name9=oppo6769
device.name10=k6833v1_64
supported.versions=
supported.patchlevels=
'; }} # end properties

# shell variables
block=/dev/block/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

ui_print "***********************************************"
ui_print "*    Realme Narzo 30A Display Overclock       *"
ui_print "*              Target: {hz} Hz                 *"
ui_print "*          Data Rate: {rate} Mbps             *"
ui_print "***********************************************"

## AnyKernel install
dump_boot;

# write new kernel (retains user ramdisk and Magisk completely)
write_boot;

# Deploy runtime rate re-arm hook for Magisk environments
for d in /data/adb/service.d /data/adb/post-fs-data.d; do
  if [ -d "$d" ]; then
    cat << 'EOF' > "$d/display_rate.sh"
#!/system/bin/sh
i=0
while [ $i -lt 40 ]; do
  if [ -e /sys/kernel/debug/mtkfb ]; then
    echo change_mipi_date_rate:{rate} > /sys/kernel/debug/mtkfb
    exit 0
  fi
  i=$((i+1)); sleep 0.25 2>/dev/null || sleep 1
done
EOF
    chmod 0755 "$d/display_rate.sh"
  fi
done

ui_print " "
ui_print "{hz}Hz display overclock installed successfully!"
ui_print " "
## end install
"""
        with open(os.path.join(stage_dir, "anykernel.sh"), "w") as f:
            f.write(anykernel_sh_content)
        os.chmod(os.path.join(stage_dir, "anykernel.sh"), 0o755)

        # Ensure tool permissions
        for root, dirs, files in os.walk(stage_dir):
            for file in files:
                filepath = os.path.join(root, file)
                if "tools" in filepath or "update-binary" in filepath or file.endswith(".sh"):
                    os.chmod(filepath, 0o755)

        # Pack ZIP
        if os.path.exists(zip_out_path):
            os.remove(zip_out_path)
        
        # Use zip binary to preserve permissions
        subprocess.run(["zip", "-r9", zip_out_path, "."], cwd=stage_dir, stdout=subprocess.DEVNULL, check=True)
        subprocess.run(["zip", "-T", zip_out_path], check=True)

        zip_size = os.path.getsize(zip_out_path)
        zip_md5 = md5_file(zip_out_path)
        zip_sha256 = sha256_file(zip_out_path)
        boot_md5 = md5_file(boot_out_path)
        boot_sha256 = sha256_file(boot_out_path)

        print(f"Generated AnyKernel3 ZIP: {zip_name} ({zip_size} bytes)")
        print(f"  ZIP MD5:    {zip_md5}")
        print(f"  BOOT MD5:   {boot_md5}")

        results.append({
            "hz": hz,
            "rate": rate,
            "is_stock": is_stock,
            "zip_name": zip_name,
            "zip_path": zip_out_path,
            "zip_size": zip_size,
            "zip_md5": zip_md5,
            "zip_sha256": zip_sha256,
            "boot_name": boot_name,
            "boot_path": boot_out_path,
            "boot_size": target_boot_size,
            "boot_md5": boot_md5,
            "boot_sha256": boot_sha256,
        })

        # Cleanup stage
        shutil.rmtree(stage_dir)
        os.remove(temp_k_path)

    print("\n=== Generation Summary Table ===")
    for r in results:
        status_tag = "(Stock Restore)" if r["is_stock"] else "(Overclock)"
        print(f"{r['hz']} Hz {status_tag}:")
        print(f"  Flashable ZIP:  {r['zip_name']} ({r['zip_size']} bytes) | MD5: {r['zip_md5']}")
        print(f"  Standalone IMG: {r['boot_name']} ({r['boot_size']} bytes) | MD5: {r['boot_md5']}")

if __name__ == "__main__":
    main()
