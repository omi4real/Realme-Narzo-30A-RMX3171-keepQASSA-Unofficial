# RealmeParts (`com.realmeparts`) — Device Features Suite

This directory contains the decompiled source tree, Dalvik Smali bytecode, and Android resources for the **RealmeParts** device companion application (`com.realmeparts`), ported and patched specifically for the **Realme Narzo 30A (`RMX3171`)** running Android 10 (#keepQASSA).

---

## 🛠️ Key Patches & Smali Modifications

### 1. Real-Time FPS Overlay & Node Binding
- **Class:** `com.realmeparts.FPSInfoService` and `com.realmeparts.FPSInfoService$CurFPSThread`
- **Driver Node:** `/dev/realme_fps` (MediaTek character device providing instant hardware display refresh and rendering rates).
- **Android 10 Compliance:**
  - Registered low-priority notification channel (`fps_info_channel`) during `onCreate()`.
  - Promoted service to persistent foreground state via `startForeground(NOTIFICATION_ID, notification)` to adhere strictly to Android 10 background execution limitations and prevent OS trimming during gameplay.

### 2. Service Invocation Lifecycle
- **Class:** `com.realmeparts.Utils`
- **Fix:** Switched execution dispatch from legacy `Context.startService(intent)` to native `Context.startForegroundService(intent)`. This completely eliminates `IllegalStateException` crashes when toggling the FPS tile or Quick Setting switch from the notification shade.

### 3. USB-OTG Power Supply Management
- **Classes:** `com.realmeparts.OtgToggleService`, `com.realmeparts.OTGModeSwitch`
- **Functionality:** Controls kernel OTG power delivery state (`/sys/class/power_supply/usb/otg_switch`), allowing safe power-on for flash drives, DACs, and external peripherals without continuous battery drain.

### 4. Gaming Touch Booster & Gestures
- **Classes:** `com.realmeparts.GameModeSwitch`, `com.realmeparts.TouchSampling`
- **Functionality:** Dispatches MediaTek touch driver performance profiles to maximize touch polling response time during gaming sessions.

---

## 📦 Building and Packaging

To recompile and deploy RealmeParts from this decompiled tree:

```bash
# 1. Recompile smali & resources using apktool:
apktool b decompiled -o RealmeParts_rebuilt.apk

# 2. 4-byte align the APK package:
zipalign -p -f -v 4 RealmeParts_rebuilt.apk RealmeParts_aligned.apk

# 3. Sign using testkey or platform key:
apksigner sign --key testkey.pk8 --cert testkey.x509.pem RealmeParts_aligned.apk

# 4. Target deployment path on device:
# Staged to /system/priv-app/RealmeParts/RealmeParts.apk
# Permissions: 0644 (rw-r--r--)
# SELinux Context: u:object_r:system_file:s0
```
