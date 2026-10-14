#!/system/bin/sh
# RMX3171 (Realme Narzo 30A) — 18W Fast-Charge Diagnostic
# Read-only. Safe to run on a live device. Requires root.
# Usage: adb shell su -c "sh /data/local/tmp/rmx3171_charge_diag.sh"

OUT=/data/local/tmp/rmx3171_charge_diag.txt
: > "$OUT"

log() { echo "$@" | tee -a "$OUT"; }
hdr() { log ""; log "===== $* ====="; }

hdr "DEVICE / ROM IDENTITY"
log "date:        $(date)"
log "uname:       $(uname -a)"
log "build:       $(getprop ro.build.display.id)"
log "model:       $(getprop ro.product.model)"
log "kernel:      $(getprop ro.kernel.version)  ($(getprop ro.bootimage.build.fingerprint))"

hdr "BATTERY / CHARGER UEVENT SNAPSHOT (all power_supply nodes)"
for d in /sys/class/power_supply/*; do
    [ -d "$d" ] || continue
    log "--- $d ---"
    if [ -r "$d/uevent" ]; then
        cat "$d/uevent" | tee -a "$OUT"
    fi
done

hdr "BATTERY CORE NODES"
for n in \
    status health present capacity capacity_level \
    voltage_now voltage_avg voltage_ocv \
    current_now current_avg \
    charge_counter charge_full charge_full_design \
    temp temperature \
    technology \
    charging_enabled battery_charging_enabled input_suspend \
    charge_type charging_type charger_type real_type \
    input_current_limit constant_charge_current constant_charge_voltage \
    input_current_limit_max constant_charge_current_max \
    ; do
    f="/sys/class/power_supply/battery/$n"
    if [ -r "$f" ]; then
        log "$(printf '%-32s' "$n") = $(cat "$f" 2>/dev/null)"
    fi
done

hdr "USB / AC / WIRELESS PORT NODES"
for port in usb ac wireless main; do
    for n in online present type real_type current_max voltage_max input_current_limit \
             input_current_limit_max current_now voltage_now usb_type \
             fast_charge_mode; do
        f="/sys/class/power_supply/$port/$n"
        if [ -r "$f" ]; then
            log "$(printf '%-32s' "$port/$n") = $(cat "$f" 2>/dev/null)"
        fi
    done
done

hdr "MTK PUMPEXPRESS / FAST-CHARGE INDICATORS"
for n in \
    pe_charger pe4_charger pe5_charger pe30_charger \
    pe_charging pe_enable pe_status \
    fast_charge fast_charge_mode fast_charging \
    charger_type charge_type charging_type \
    step_charging_enabled step_charging_status \
    thermal_charging_current_limit thermal_input_current_limit \
    thermal_throttling thermal_status \
    ; do
    for base in /sys/class/power_supply/battery /sys/class/power_supply/charger; do
        f="$base/$n"
        if [ -r "$f" ]; then
            log "$(printf '%-40s' "$base/$n") = $(cat "$f" 2>/dev/null)"
        fi
    done
done

hdr "MTK CHARGER PLATFORM NODES"
for f in \
    /proc/mtk_battery_cmd/current_cmd \
    /proc/mtk_battery_cmd/charger_cmd \
    /proc/mtk_charger/charger_type \
    /proc/mtk_charger/pe_status \
    /proc/mtk_charger/pe4_status \
    /proc/mtk_charger/pe5_status \
    /proc/mtk_charger/charging_current \
    /proc/mtk_charger/input_current \
    /sys/kernel/charger/charger_type \
    /sys/kernel/charger/pe_status \
    /sys/devices/platform/charger/charger_type \
    /sys/devices/platform/charger/pe_status \
    ; do
    if [ -r "$f" ]; then
        log "$(printf '%-48s' "$f") = $(cat "$f" 2>/dev/null)"
    fi
done

hdr "MTK CHARGER DEBUGFS (if present)"
for f in \
    /sys/kernel/debug/mtk_charger/charger_type \
    /sys/kernel/debug/mtk_charger/pe_status \
    /sys/kernel/debug/mtk_charger/pe4_status \
    /sys/kernel/debug/mtk_charger/pe5_status \
    /sys/kernel/debug/mtk_charger/charging_current \
    /sys/kernel/debug/mtk_charger/input_current \
    /sys/kernel/debug/charger/charger_type \
    ; do
    if [ -r "$f" ]; then
        log "$(printf '%-48s' "$f") = $(cat "$f" 2>/dev/null)"
    fi
done

hdr "THERMAL / CHARGING THROTTLE NODES"
for f in \
    /sys/class/thermal/thermal_zone*/type \
    /sys/class/thermal/thermal_zone*/temp \
    /sys/class/thermal/cooling_device*/type \
    /sys/class/thermal/cooling_device*/cur_state \
    /sys/class/thermal/cooling_device*/max_state \
    ; do
    for g in $f; do
        [ -r "$g" ] || continue
        log "$(printf '%-56s' "$g") = $(cat "$g" 2>/dev/null)"
    done
done

hdr "DUMPSYS BATTERY"
dumpsys battery 2>/dev/null | tee -a "$OUT"

hdr "DUMPSYS BATTERYPROPERTIES"
dumpsys batteryproperties 2>/dev/null | tee -a "$OUT"

hdr "DUMPSYS CHARGER (MTK, if present)"
dumpsys charger 2>/dev/null | tee -a "$OUT"

hdr "DUMPSYS THERMALSERVICE (charging-related lines)"
dumpsys thermalservice 2>/dev/null | grep -iE "charg|batt|current|limit" | tee -a "$OUT"

hdr "KERNEL CHARGER LOG (last 200 lines)"
dmesg 2>/dev/null | grep -iE "charg|pe[0-9]|pump|batt|current|thermal" | tail -n 200 | tee -a "$OUT"

hdr "LOADED CHARGER-RELATED KERNEL MODULES"
lsmod 2>/dev/null | grep -iE "charg|batt|pe|pump" | tee -a "$OUT"

hdr "CHARGER-RELATED KERNEL SYMBOLS (if kallsyms readable)"
grep -iE "pe[0-9]|pump_express|mtk_charger|charger_type" /proc/kallsyms 2>/dev/null | head -n 50 | tee -a "$OUT"

hdr "DONE"
log "Full report written to: $OUT"
