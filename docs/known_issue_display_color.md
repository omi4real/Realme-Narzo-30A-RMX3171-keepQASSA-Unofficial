# KNOWN ISSUE — Display Grayscale / Black Panel after boot (RMX3171)

> **Status:** FIXED & BAKED INTO SHIPPING ROM (2026-10-06 verified: image §6b sends no SurfaceFlinger transactions; module only needed on pre-2026-09-27 builds)
> **Affected ROM:** KeepQassa Sisu v2.4 Vanilla — RMX3171 port (`qassa_Sisu-v2.4.s-RMX3171-20250617-0312-Vanilla-signed.zip`)
> **Severity:** Critical (blank display, still rings / vibrates / adb works)
> **Workaround artifact:** `output/N30A_DisplayColorFix_Magisk.zip`

---

## 1. Symptom (reproducible on every boot)

After a clean boot the device behaves as follows:

1. Realme logo, ROM boot animation, and roughly the first minute of the ROM UI display **normally** (full colour).
2. ~45–60 s after `sys.boot_completed=1` the panel **drops saturation** (grayscale / black & white).
3. Seconds later the panel goes **fully black while the backlight stays on** (grey glow on the IPS panel).
4. The phone is otherwise alive: key-combination vibration, incoming calls ringing, `adb` shell, root, etc. — but the screen cannot be used to answer.

Confirmed: PitchBlack Recovery UI, the bootloader logo and the ROM boot animation all render fine, so the panel and DSI path are healthy. The fault is in the **Android/MediaTek HWC colour pipeline**, not the hardware.

---

## 2. Root cause

The ported LiveDisplay **Picture Adjustment** feature (Task 1 / Task 15) adds a boot-time restore hook in `/system/bin/n30a_fixes.sh`, **section 6b**. After `sys.boot_completed=1` it re-applied the saved adjustment to SurfaceFlinger, including the 4×4 colour matrix via SurfaceFlinger **transaction 1015**:

```
service call SurfaceFlinger 1015 s16 android.ui.ISurfaceComposer i32 1 $mat_args
```

On the MTK MT6768/MT6769 hardware composer used by the Realme Narzo 30A this transaction corrupts the HWC colour registers:

- first stage → global saturation collapses to 0 (grayscale),
- second stage → the composited output goes fully black while the backlight remains on.

The corruption is **not** cleared by a SurfaceFlinger restart or a composer HAL restart — only a full reboot (which re-initialises the display driver) clears it. Because the boot hook re-runs on every boot, the device black-screens again ~1 minute after every reboot.

Adjusting any slider in `Settings → Display → LiveDisplay` re-writes a *valid* transform through the smali code path and temporarily restores the panel, which is why the UI would "come back" when that screen was touched.

---

## 3. Fix — `N30A_DisplayColorFix_Magisk.zip`

The module overlays a corrected `/system/bin/n30a_fixes.sh` (Magisk magic-mount). Section 6b is replaced with a hardware-safe implementation that:

- **never** sends SurfaceFlinger transaction 1015 (the corrupting matrix push), and
- restores only `persist.sys.sf.color_saturation = 1.0`, which SurfaceFlinger's built-in `PropertyWatcher` consumes live (no IPC transaction needed).

Everything else in `n30a_fixes.sh` is byte-for-byte unchanged (camera bind-mounts, codec XMLs, audio params, lights/hwcomposer bind mounts, GMS toggle, FPS loop, etc.).

Consequences:

- Boot is always neutral: full-colour display, no matrix corruption.
- LiveDisplay Picture Adjustment still works **live** within a session (sliders respond in real time); it is simply no longer auto-replayed at boot.
- No ROM ZIP or boot image change is required.

### Module contents

```
n30a_display_color_fix/
├── module.prop
└── system/
    └── bin/
        └── n30a_fixes.sh        (md5 a99507726d648dbe15be7f5fa04aeedb)
```

### Install (Magisk v20+)

**Via Magisk app**
1. Copy `N30A_DisplayColorFix_Magisk.zip` to the device.
2. Magisk → Modules → *Install from storage* → select the zip.
3. Reboot.

**Via adb (root present)**
```bash
adb push output/N30A_DisplayColorFix_Magisk.zip /data/local/tmp/
adb shell magisk --install-module /data/local/tmp/N30A_DisplayColorFix_Magisk.zip
adb reboot
```

### Verify after reboot
```bash
adb shell md5sum /system/bin/n30a_fixes.sh          # expect a99507726d648dbe15be7f5fa04aeedb
adb shell grep -c "service call SurfaceFlinger 1015" /system/bin/n30a_fixes.sh   # expect 0
adb shell getprop persist.sys.sf.color_saturation   # expect 1.0
```

### Uninstall
Magisk → Modules → remove `N30A Display Color Fix (RMX3171)` → reboot.

---

## 4. Artifact & checksums

| Field | Value |
|---|---|
| Path | `output/N30A_DisplayColorFix_Magisk.zip` |
| Size | 3,569 bytes |
| Module ID | `n30a_display_color_fix` |
| MD5 | `54558e1bd770f1d5a4c4e8bad34d1a63` |
| SHA-256 | `af1bb26ceb415ff5eb2a3c44d268fdb9c7e6f3d2d8876f707ffd14c76651a388` |
| Module source tree | `n30a_display_color_fix/` |

---

## 5. Follow-up / permanent option

If this is later folded into the next ROM build, replace section 6b of `/system/bin/n30a_fixes.sh` in `system.img` with the safe block above and drop the module requirement. The module remains useful for already-flashed devices.

## 6. Related observation (not this bug)

The ILITEK TDDI touch controller on this unit logs periodic `SPI ACK failed, doing spi recovery` and runs `FW upgrade pass`. Touch still functions through the driver's recovery loop. This appears on some aftermarket replacement panels and is independent of the colour bug above; it is noted here only for completeness.
