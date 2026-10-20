#!/system/bin/sh
# Narzo 30A (RMX3171) Hardware & System Compatibility Engine
FIX_DIR="/system/etc/n30a_fixes"

# 1. Camera Fix (MediaTek CMDQ / libdpframework.so)
if [ -f "$FIX_DIR/vendor/lib64/libdpframework.so" ] && [ -d "/vendor/lib64" ]; then
    mount --bind "$FIX_DIR/vendor/lib64/libdpframework.so" /vendor/lib64/libdpframework.so
fi
if [ -f "$FIX_DIR/vendor/lib/libdpframework.so" ] && [ -d "/vendor/lib" ]; then
    mount --bind "$FIX_DIR/vendor/lib/libdpframework.so" /vendor/lib/libdpframework.so
fi

# 2. Video Playback Fix (MediaTek VP9 1440p60 & Codec2 hardware decoding)
if [ -f "$FIX_DIR/vendor/etc/media_codecs_mediatek_video.xml" ] && [ -d "/vendor/etc" ]; then
    mount --bind "$FIX_DIR/vendor/etc/media_codecs_mediatek_video.xml" /vendor/etc/media_codecs_mediatek_video.xml
fi
if [ -f "$FIX_DIR/vendor/etc/media_codecs_performance.xml" ] && [ -d "/vendor/etc" ]; then
    mount --bind "$FIX_DIR/vendor/etc/media_codecs_performance.xml" /vendor/etc/media_codecs_performance.xml
fi
if [ -f "$FIX_DIR/vendor/etc/media_codecs_c2.xml" ] && [ -d "/vendor/etc" ]; then
    mount --bind "$FIX_DIR/vendor/etc/media_codecs_c2.xml" /vendor/etc/media_codecs_c2.xml
fi
if [ -f "$FIX_DIR/vendor/etc/vintf/manifest.xml" ] && [ -d "/vendor/etc/vintf" ]; then
    mount --bind "$FIX_DIR/vendor/etc/vintf/manifest.xml" /vendor/etc/vintf/manifest.xml
fi

# 2b. Audio Boost (Media Speaker, Earpiece & Call Loudness Boost)
AUDIO_PARAM_DIR="$FIX_DIR/vendor/etc/audio_param/oppo6769_206AC_533"
TARGET_AUDIO_DIR="/vendor/etc/audio_param/oppo6769_206AC_533"
if [ -d "$AUDIO_PARAM_DIR" ] && [ -d "$TARGET_AUDIO_DIR" ]; then
    for f in "$AUDIO_PARAM_DIR"/*; do
        if [ -f "$f" ]; then
            fname=$(basename "$f")
            mount --bind "$f" "$TARGET_AUDIO_DIR/$fname"
        fi
    done
fi

# 3. Brightness Fix (Stock Narzo 30A lights module)
if [ -f "$FIX_DIR/odm/lib64/hw/lights.mt6768.so" ]; then
    if [ -d "/odm/lib64/hw" ]; then
        mount --bind "$FIX_DIR/odm/lib64/hw/lights.mt6768.so" /odm/lib64/hw/lights.mt6768.so
    fi
    if [ -d "/vendor/lib64/hw" ]; then
        mount --bind "$FIX_DIR/odm/lib64/hw/lights.mt6768.so" /vendor/lib64/hw/lights.mt6768.so
    fi
fi

# 4. HWC UI Abort Fix
if [ -f "$FIX_DIR/odm/lib64/hw/hwcomposer.mt6768.so" ]; then
    if [ -d "/odm/lib64/hw" ]; then
        mount --bind "$FIX_DIR/odm/lib64/hw/hwcomposer.mt6768.so" /odm/lib64/hw/hwcomposer.mt6768.so
    fi
    if [ -d "/vendor/lib64/hw" ]; then
        mount --bind "$FIX_DIR/odm/lib64/hw/hwcomposer.mt6768.so" /vendor/lib64/hw/hwcomposer.mt6768.so
    fi
fi

# 5. Realme Hardware Nodes Permissions (Touch sampling, DT2W, OTG, FPS, MTK Perf)
chmod 0666 /proc/touchpanel/game_switch_enable 2>/dev/null
chmod 0666 /proc/touchpanel/oppo_tp_limit_enable 2>/dev/null
chmod 0666 /proc/touchpanel/oppo_tp_direction 2>/dev/null
chmod 0666 /proc/touchpanel/double_tap_enable 2>/dev/null
chmod 0666 /sys/class/power_supply/usb/otg_switch 2>/dev/null
chmod 0664 /sys/module/primary_display/parameters/display_framerate_main 2>/dev/null
chmod 0666 /sys/module/ged/parameters/* 2>/dev/null
chmod 0666 /proc/cpufreq/* 2>/dev/null
chmod 0666 /proc/gpufreq/* 2>/dev/null
chmod 0666 /proc/ppm/* 2>/dev/null
chmod 0666 /proc/ppm/policy/* 2>/dev/null
chmod 0666 /sys/devices/system/cpu/eas/* 2>/dev/null
chmod 0666 /sys/devices/system/cpu/cpufreq/schedutil/* 2>/dev/null

# 5b. Initialize Realme FPS node
echo "60.0" > /dev/realme_fps
chmod 0666 /dev/realme_fps

# 5c. Fast Charge Current Restoration (BQ2589x 18W Clean)
# Sets current_percent to 100% (restores full 2A @ 9V QC 18W fast charging without adapter OCP collapse)
# Eliminates artificial 150% scaling that causes low-battery charging disconnect loops and thermal overheating
echo 100 > /sys/module/oppo_bq2589x_charger/parameters/current_percent 2>/dev/null

# 5d. Game Mode State Enforcement & Performance Watchdog
(
    while true; do
        sleep 5
        perf=$(getprop perf_profile)
        tp_game=$(cat /proc/touchpanel/game_switch_enable 2>/dev/null)
        if [ "$perf" = "1" ] || [ "$tp_game" = "1" ]; then
            # Keep touchpanel sampling boost active
            [ "$tp_game" != "1" ] && echo 1 > /proc/touchpanel/game_switch_enable 2>/dev/null
            [ "$(cat /proc/touchpanel/oppo_tp_limit_enable 2>/dev/null | grep -o '[0-9]' | head -n 1)" != "0" ] && echo 0 > /proc/touchpanel/oppo_tp_limit_enable 2>/dev/null
            [ "$(cat /proc/touchpanel/oppo_tp_direction 2>/dev/null | grep -o '[0-9]' | head -n 1)" != "1" ] && echo 1 > /proc/touchpanel/oppo_tp_direction 2>/dev/null

            # Keep CPU & GPU governors in sports / boost performance mode
            [ "$(cat /sys/module/ged/parameters/gx_game_mode 2>/dev/null)" != "1" ] && echo 1 > /sys/module/ged/parameters/gx_game_mode 2>/dev/null
            [ "$(cat /sys/module/ged/parameters/gx_force_cpu_boost 2>/dev/null)" != "1" ] && echo 1 > /sys/module/ged/parameters/gx_force_cpu_boost 2>/dev/null
            case "$(cat /proc/cpufreq/cpufreq_power_mode 2>/dev/null)" in
                *Performance*) ;;
                *) echo 3 > /proc/cpufreq/cpufreq_power_mode 2>/dev/null ;;
            esac
            case "$(cat /proc/gpufreq/gpufreq_opp_freq 2>/dev/null)" in
                *enabled*) ;;
                *) echo 823000 > /proc/gpufreq/gpufreq_opp_freq 2>/dev/null ;;
            esac
            case "$(cat /proc/ppm/enabled 2>/dev/null)" in
                *disabled*) ;;
                *) echo 0 > /proc/ppm/enabled 2>/dev/null ;;
            esac
            [ "$perf" != "1" ] && setprop perf_profile 1
        fi
    done
) &

# 6. Post-Boot System Initialization (Gestures, Permissions & Keyboard)
(
    while [ "$(getprop sys.boot_completed)" != "1" ]; do
        sleep 1
    done

    # Grant Realme Settings overlay and secure settings permissions
    appops set com.realmeparts SYSTEM_ALERT_WINDOW allow 2>/dev/null
    pm grant com.realmeparts android.permission.WRITE_SECURE_SETTINGS 2>/dev/null

    # Restore Game Mode if saved as enabled in RealmeParts shared preferences
    PREF="/data/data/com.realmeparts/shared_prefs/com.realmeparts_preferences.xml"
    if [ -f "$PREF" ] && grep -q '<boolean name="game" value="true"' "$PREF"; then
        setprop perf_profile 1
        /system/bin/perf_profile.sh 1 2>/dev/null
        echo 1 > /proc/touchpanel/game_switch_enable 2>/dev/null
        echo 0 > /proc/touchpanel/oppo_tp_limit_enable 2>/dev/null
        echo 1 > /proc/touchpanel/oppo_tp_direction 2>/dev/null
    fi

    # Re-apply hardware node permissions post boot
    chmod 0666 /proc/touchpanel/game_switch_enable 2>/dev/null
    chmod 0666 /proc/touchpanel/oppo_tp_limit_enable 2>/dev/null
    chmod 0666 /proc/touchpanel/oppo_tp_direction 2>/dev/null
    chmod 0666 /proc/touchpanel/double_tap_enable 2>/dev/null
    chmod 0666 /sys/class/power_supply/usb/otg_switch 2>/dev/null
    chmod 0664 /sys/module/primary_display/parameters/display_framerate_main 2>/dev/null

    # Wake Quickstep service
    am start-service -a android.intent.action.QUICKSTEP_SERVICE com.android.launcher3 2>/dev/null

    # Cycle navigation overlay to auto-bind SystemUI OverviewProxyService on first boot
    if [ ! -f "/data/system/.n30a_gestures_initialized" ]; then
        cmd overlay enable-exclusive --category com.android.internal.systemui.navbar.threebutton 2>/dev/null
        sleep 1
        cmd overlay enable-exclusive --category com.android.internal.systemui.navbar.gestural 2>/dev/null
        mkdir -p /data/system 2>/dev/null
        touch /data/system/.n30a_gestures_initialized 2>/dev/null
    fi

    # Configure Simple Keyboard as default input method
    for i in 1 2 3 4 5; do
        ime enable --user 0 rkr.simplekeyboard.inputmethod/.latin.LatinIME 2>/dev/null
        ime set rkr.simplekeyboard.inputmethod/.latin.LatinIME 2>/dev/null
        settings put secure default_input_method rkr.simplekeyboard.inputmethod/.latin.LatinIME 2>/dev/null
        settings put secure enabled_input_methods "rkr.simplekeyboard.inputmethod/.latin.LatinIME" 2>/dev/null
        settings put secure show_ime_with_hard_keyboard 1 2>/dev/null
        sleep 2
    done

    # 6b. Display color pipeline (SAFE MODE - N30A Display Color Fix)
    #
    # WARNING: Do NOT push the LiveDisplay 4x4 color matrix via SurfaceFlinger
    # transaction 1015 here. On the MTK MT6768/MT6769 HWC (and this panel), that
    # transaction corrupts the hardware color pipeline: the panel first loses
    # saturation (grayscale), then goes fully black while the backlight stays on.
    # The damage is not cleared by SurfaceFlinger/HWC restart, only by reboot,
    # so the device would black out again ~1 min after every boot.
    #
    # We only restore the saturation value through its system property. The
    # SurfaceFlinger PropertyWatcher consumes persist.sys.sf.color_saturation
    # live, so no IPC transaction is required and the matrix path stays disabled.
    # Hue/Contrast/Intensity live only for the current session; adjusting them in
    # Settings -> Display -> LiveDisplay still works in real time.
    setprop persist.sys.sf.color_saturation 1.0

    # 6c. Restore Google Services state
    gms_en=$(settings get secure gms_enabled 2>/dev/null)
    if [ "$gms_en" = "0" ]; then
        pm disable com.google.android.gms 2>/dev/null
        pm disable com.android.vending 2>/dev/null
        pm disable com.google.android.gsf 2>/dev/null
        am force-stop com.google.android.gms 2>/dev/null
        am force-stop com.android.vending 2>/dev/null
        am force-stop com.google.android.gsf 2>/dev/null
    else
        pm enable com.google.android.gms 2>/dev/null
        pm enable com.android.vending 2>/dev/null
        pm enable com.google.android.gsf 2>/dev/null
    fi

    # 6d. QuickStep gesture navigation watchdog (third-party launcher stability)
    (
        while true; do
            sleep 30
            if ! pidof com.android.launcher3 >/dev/null 2>&1; then
                am start-service -a android.intent.action.QUICKSTEP_SERVICE com.android.launcher3 2>/dev/null
            fi
        done
    ) &

    # 6e. Sync imported pif.json (Settings -> Spoofing -> Play Integrity Fix) to the
    # PlayIntegrityFix Magisk module so the imported fingerprint is actually applied.
    if [ -d /data/adb/modules/playintegrityfix ]; then
        CFG=$(settings get secure spoof_pif_config 2>/dev/null)
        case "$CFG" in ''|'null') ;; *)
            pifv() { printf '%s' "$CFG" | tr -d '\n' | sed -n 's/.*"'"$1"'"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | sed 's|\\/|/|g'; }
            FP=$(pifv FINGERPRINT)
            if [ -n "$FP" ]; then
                MFR=$(pifv MANUFACTURER); MDL=$(pifv MODEL); BRD=$(pifv BRAND)
                DEV=$(pifv DEVICE); SP=$(pifv SECURITY_PATCH); SDK=$(pifv DEVICE_INITIAL_SDK_INT)
                PROD=$(printf '%s' "$FP" | cut -d/ -f2)
                REL=$(printf '%s' "$FP" | cut -d: -f2 | cut -d/ -f1)
                ID=$(printf '%s' "$FP" | cut -d: -f2 | cut -d/ -f2)
                INCR=$(printf '%s' "$FP" | cut -d: -f2 | cut -d/ -f3)
                TYPE=$(printf '%s' "$FP" | cut -d: -f3 | cut -d/ -f1)
                TAGS=$(printf '%s' "$FP" | cut -d: -f3 | cut -d/ -f2)
                OUT=/data/adb/modules/playintegrityfix/custom.pif.prop
                {
                    echo "MANUFACTURER=${MFR:-Google}"
                    echo "MODEL=${MDL:-Pixel 9 Pro XL}"
                    echo "FINGERPRINT=$FP"
                    echo "BRAND=${BRD:-google}"
                    echo "PRODUCT=${PROD:-komodo_beta}"
                    echo "DEVICE=${DEV:-komodo}"
                    echo "RELEASE=${REL:-16}"
                    echo "ID=${ID}"
                    echo "INCREMENTAL=${INCR}"
                    echo "TYPE=${TYPE:-user}"
                    echo "TAGS=${TAGS:-release-keys}"
                    echo "SECURITY_PATCH=${SP:-2026-04-05}"
                    echo "DEVICE_INITIAL_SDK_INT=${SDK:-34}"
                    echo "spoofBuild=1"
                    echo "spoofProps=1"
                    echo "spoofProvider=1"
                    echo "spoofSignature=0"
                    echo "spoofVendingFinger=0"
                    echo "spoofVendingSdk=0"
                    echo "verboseLogs=0"
                } > "$OUT"
                chmod 0644 "$OUT"
                am force-stop com.google.android.gms 2>/dev/null
            fi
            ;;
        esac
    fi

    # 7. Real-time Hardware FPS Monitor Loop
    touch /dev/realme_fps 2>/dev/null
    chmod 0666 /dev/realme_fps 2>/dev/null
    while true; do
        fps=$(cat /sys/kernel/debug/fpsgo/fstb/fpsgo_status 2>/dev/null | awk '$3 ~ /^[0-9]+$/ && $3 > 0 {print $3; exit}')
        if [ -n "$fps" ]; then
            echo "$fps" > /dev/realme_fps
            sleep 1.0
            continue
        fi

        fps=$(dumpsys SurfaceFlinger 2>/dev/null | awk '/FPS ring buffer:/{flag=1; next} flag && /fps=/{split($2, t, /[:.]/); sec = t[1]*3600 + t[2]*60 + t[3] + ("0." t[4]); if (sec > max_sec) { max_sec = sec; f = $3; }} END {sub(/fps=/, "", f); if (f != "") print f; else print "60.0";}')
        [ -z "$fps" ] && fps="60.0"
        echo "$fps" > /dev/realme_fps
        sleep 1.0
    done
) &

