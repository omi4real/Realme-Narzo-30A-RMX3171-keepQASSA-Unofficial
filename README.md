<div align="center">

# Realme Narzo 30A (RMX3171) — #keepQASSA [Unofficial]

[![Android](https://img.shields.io/badge/Android-10.0_(Q)-3DDC84?style=flat-square&logo=android&logoColor=white)](https://android.com)
[![Device](https://img.shields.io/badge/Device-RMX3171-blue?style=flat-square)](https://github.com/omi4real/Realme-Narzo-30A-RMX3171-keepQASSA-Unofficial)
[![ROM](https://img.shields.io/badge/ROM-%23keepQASSA-black?style=flat-square&logo=github)](https://github.com/keepQASSA)
[![Type](https://img.shields.io/badge/Type-Unofficial_Port-orange?style=flat-square)](https://github.com/omi4real/Realme-Narzo-30A-RMX3171-keepQASSA-Unofficial)
[![Status](https://img.shields.io/badge/Status-Stable_/_Daily_Driver-brightgreen?style=flat-square)](https://github.com/omi4real/Realme-Narzo-30A-RMX3171-keepQASSA-Unofficial)
[![Maintainer](https://img.shields.io/badge/Maintainer-omi4real-blueviolet?style=flat-square)](https://github.com/omi4real)

An optimized, stable Android 10 (Q) Vanilla custom ROM port and comprehensive device toolkit for the **Realme Narzo 30A** (`RMX3171`), ported from `RMX2020`.

[**Downloads**](#downloads) • [**Screenshots**](#screenshots) • [**Flashing Guide**](#flashing-instructions) • [**Device Specs**](#device-specs) • [**What's Working**](#system-status) • [**Credits**](#credits) • [**Technical Bible**](./FINAL_RELEASE_SUMMARY.md)

</div>

---

> [!IMPORTANT]
> **Disclaimer & Unofficial Notice:** This is an **UNOFFICIAL** port and build for the Realme Narzo 30A (`RMX3171`). It is maintained independently by **omi4real** and is neither officially affiliated with nor endorsed by the official **[#keepQASSA](https://github.com/keepQASSA)** team.
> 
> This build is a direct port from the `RMX2020` base ROM (`qassa_Sisu-v2.4.s-RMX2020-20250617-0312-GApps-sign.zip`) originally built by **[@szyryjn](https://t.me/szyryjn)** on Telegram, with device trees and bringup groundwork by **[@sarthakroy](https://github.com/sarthakroy2002)** and **[@koushikdey](https://github.com/koushikdey)**. Full gratitude and credit belong to the original creators!

---

<a id="device-specs"></a>
## 📱 Device Specifications

| Parameter | Hardware Ground Truth (`RMX3171`) |
| :--- | :--- |
| **Device Model** | **Realme Narzo 30A (`RMX3171`)** |
| **Chipset (SoC)** | MediaTek MT6769Z Helio G85 (12nm, Octa-Core: 2x A75 @ 2.0GHz + 6x A55 @ 1.8GHz) |
| **GPU** | ARM Mali-G52 MC2 |
| **Display** | 6.5" IPS LCD (720 × 1600, 20:9, 60 Hz) |
| **Battery & Charging** | 6000 mAh Li-Po, 18W Fast Charging (governed dynamically) |
| **OS Userland** | Android 10.0 (Q, API Level 29, 64-bit ARM64) |
| **Port Base** | `RMX2020` (`qassa_Sisu-v2.4.s-RMX2020-20250617-0312-GApps-sign.zip` by @szyryjn) |
| **SELinux** | Permissive |

---

<a id="system-status"></a>
## ✅ System Status

**Almost everything.** This port is stable, reliable, and verified for daily-driver use:

- [x] **Cellular / RIL:** Phone calls, SMS, Dual-SIM VoLTE, 4G/LTE mobile data
- [x] **Wi-Fi:** 2.4 GHz & 5 GHz (Dual-band hotspot broadcasting unlocked)
- [x] **Bluetooth:** Audio streaming, media playback, BLE pairing
- [x] **Cameras:** Front & rear photo capture, video recording, flashlight
- [x] **Audio:** Loudspeaker, earpiece, microphone, 3.5mm headphone jack
- [x] **Biometrics:** Rear fingerprint scanner
- [x] **Sensors:** Accelerometer, proximity, light sensor
- [x] **Display:** Stock 60 Hz refresh rate (Fluid 64 Hz overclock available)
- [x] **Storage & USB:** Internal storage, SD Card, USB-OTG
- [x] **Battery & Charging:** Fast charging with dynamic thermal governor (100% – 150%)
- [x] **Google Play Services:** GMS signature-safe self-updates, certified Play Store

---

<a id="highlights"></a>
## ⚡ Key Highlights & Port Enhancements

* **🎨 LiveDisplay Picture Adjustment:** Full RGB calibration and saturation sliders enabled in Settings without triggering MediaTek SurfaceFlinger hardware lockups.
* **🛡️ Play Store Self-Update Fix (`services.jar`):** Resolved the fatal Android 10 `PackageManagerService` verification crash during background Play Store split-APK self-updates.
* **📶 Dual-Band 5 GHz Hotspot (`wifi-service.jar`):** Overrode MediaTek stock constraints to allow full 5 GHz Wi-Fi hotspot broadcasting.
* **🔋 Dynamic Thermal-Charging Governor (`scripts/n30a_fixes_current.sh`):** Real-time thermal daemon scaling charging speeds safely up to 150% below 38 °C and tapering down as temperature rises.
* **🚀 64 Hz LCD Display Overclock (`scripts/build_display_oc_packages.py`):** Kernel MIPI DSI frequency patch raising display refresh rate from 60 Hz to 64 Hz for noticeably smoother UI scrolling *(Note: Tested & confirmed on replacement display panels; original factory panel behavior may vary)*.
* **⚙️ RealmeParts Hardware Suite (`realme_parts/`):** Ported device features app providing real-time FPS overlay, USB-OTG quick toggle, and hardware switches.

---

<a id="screenshots"></a>
## 📸 Screenshots & UI Preview

| About Phone & Hardware | Homescreen & Launcher | LiveDisplay Color HSIC | RealmeParts & Real-Time FPS |
| :---: | :---: | :---: | :---: |
| <img src="./screenshots/about_phone.png" width="200" alt="About Phone & Hardware" /> | <img src="./screenshots/lawnchair_home2.png" width="200" alt="Homescreen & Launcher" /> | <img src="./screenshots/livedisplay.png" width="200" alt="LiveDisplay Color HSIC" /> | <img src="./screenshots/fps_live2.png" width="200" alt="RealmeParts FPS Overlay" /> |

---

<a id="downloads"></a>
## 📦 Downloads & Checksums

All flashable binaries, recovery packages, and companion APKs are hosted on the **[Releases](https://github.com/omi4real/Realme-Narzo-30A-RMX3171-keepQASSA-Unofficial/releases)** page:

| Deliverable | File | MD5 Checksum |
| :--- | :--- | :--- |
| **Base ROM**<br><sub>Full flashable Android 10 OS (~1.07 GB)</sub> | `qassa_Sisu-v2.4.s-RMX3171-20250617-0312-Vanilla-signed.zip` | `358b6c59918f7a2a2167317d3d5be199` |
| **Google Apps**<br><sub>ARM64 native Play Services & Store (~64 MB)</sub> | `LiteGapps-arm64-10.0-RMX3171-Patched.zip` | `1f88d8c33284f7a7c7534283256f663b` |
| **64Hz Display OC**<br><sub>AnyKernel3 recovery installer (~12 MB)</sub> | `RMX3171_Display_OC_64Hz.zip` | `22d119f8a84ede853a20aebd967fe06b` |
| **64Hz Boot Image**<br><sub>Standalone Magisk-rooted boot image (32 MB)</sub> | `boot_rmx3171_64hz.img` | `8b8dc4ac72bed943be8ab06ad7c5f29b` |
| **RealmeParts App**<br><sub>Ported device settings companion (~10 MB)</sub> | `RealmeParts_signed.apk` | `0f5a6999f9f24382240b3dfb95c0dc26` |
| **Game Unlocker**<br><sub>Magisk high-FPS spoof module (~4.4 MB)</sub> | `Infinix_GT50Pro_S25Ultra_GameUnlocker.zip` | `4e31d218a1858317375261548705c8ab` |
| **Unified Settings APK**<br><sub>LiveDisplay & PIF integrated settings (~62 MB)</sub> | `Settings_signed.apk` | `d831fffb11d9656f0f9290f9b522fef6` |
| **Display Color Fix**<br><sub>Optional boot desaturation fix (~3.5 KB)</sub> | `N30A_DisplayColorFix_Magisk.zip` | `54558e1bd770f1d5a4c4e8bad34d1a63` |
| **GMS Update Fix**<br><sub>Optional Play Store self-update fix (~5 MB)</sub> | `N30A_GMS_UpdateFix_Magisk.zip` | `bac3a0d746ab18632ef02ce6abbfff2c` |
| **Audio Boost Addon**<br><sub>Loudspeaker output boost module (~3 KB)</sub> | `N30A_AudioBoost_Magisk.zip` | `e8ffbb0f5ffcc1061dab72e7fd6868b1` |
| **5GHz Hotspot Addon**<br><sub>Dual-band Wi-Fi tethering module (~1.1 MB)</sub> | `N30A_WiFi5GHz_Magisk.zip` | `32b2783585fc2c27e40a039bbb59b44a` |

---

<a id="flashing-instructions"></a>
## 🛠️ Flashing Instructions

### Prerequisites
* Unlocked bootloader on **Realme Narzo 30A (`RMX3171`)**.
* Custom Recovery: **[Pitch Black Recovery Project (PBRP)](https://t.me/rmx3171important/406)** based on and for **Realme UI 1.0** *(Mandatory — our ROM is based on RUI 1.0)*.
* Full backup of personal data.
* Reference: [Community Flashing Guide for Realme Moon Devices](https://telegra.ph/Flashing-Guide-for-Realme-Moon-Devices-01-17) *(Follow the Realme UI 2.0 section in the guide, as the steps for our Realme UI 1.0 ROM are identical)*.

### Installation Steps
1. **Reboot to Recovery Mode** (PBRP for Realme UI 1.0).
2. **Flash the ROM ZIP:** Flash `qassa_Sisu-v2.4.s-RMX3171-20250617-0312-Vanilla-signed.zip`.
3. **Flash GApps (Optional):** Flash `LiteGapps-arm64-10.0-RMX3171-Patched.zip` *(Skip if ROM is a GApps build; optional for Vanilla)*.
4. **Flash Magisk (Optional, Recommended):** Flash Magisk (v30.7 or latest).
5. **Flash Display Overclock (Optional):** Flash `RMX3171_Display_OC_64Hz.zip` (or flash `boot_rmx3171_64hz.img` via fastboot/recovery).
6. **Format Data (MUST):** Go to **Wipe** $\to$ **Format Data** $\to$ type `yes`. *(Mandatory step to avoid encryption bootloops).*
7. **Reboot to System.**

---

## 📁 Repository Structure

```text
Realme-Narzo-30A-RMX3171-keepQASSA-Unofficial/
├── README.md                      # Project documentation & release overview
├── FINAL_RELEASE_SUMMARY.md       # Master 76 KB reverse-engineering journal
├── LICENSE                        # Apache License 2.0 open-source license
├── docs/                          # In-depth technical architecture notes
├── scripts/                       # Kernel patchers, thermal governor & diagnostic tools
│   ├── build_display_oc_packages.py # Automated kernel MIPI overclock patcher
│   ├── n30a_fixes_current.sh      # Thermal charging daemon & system initialization
│   ├── rmx3171_charge_diag.sh     # Charging diagnostics & battery metrics tool
│   ├── rmx3171.tweaks.rc          # Vendor init tweaks for Helio G85
│   └── sdat2img.py                # Sparse image conversion utility
├── realme_parts/                  # Realme Narzo 30A device features app source/smali
├── game_unlocker_custom/          # High-FPS refresh & thermal spoofing Magisk module
├── n30a_display_color_fix/        # LiveDisplay HSIC color calibration overlay module
├── overlay_work/                  # Android framework device resource overlays
├── img2sdat/                      # Sparse Android image conversion utilities
└── screenshots/                   # Device verification & test screenshots
```

---

<a id="credits"></a>
## 🙏 Credits & Acknowledgements

* **[#keepQASSA Team](https://github.com/keepQASSA):** For the incredible `#keepQASSA` Android 10 ROM source, features, and philosophy (*"You already know what Q mean!"*).
* **[@szyryjn](https://t.me/szyryjn) on Telegram:** For the base `RMX2020` ROM build (`qassa_Sisu-v2.4.s-RMX2020-20250617-0312-GApps-sign.zip`), from which this Narzo 30A port was created.
* **[@sarthakroy](https://github.com/sarthakroy2002) & [@koushikdey](https://github.com/koushikdey):** Special thanks for the device trees and bringup groundwork.
* **[Realme C3 / Narzo 10A OSS Vendor Team](https://telegra.ph/Realme-C3Narzo-10A-OSS-Vendor-Credits-08-30):** For the vendor blobs, kernel fixes, and OSS tree components (see full vendor credits [here](https://telegra.ph/Realme-C3Narzo-10A-OSS-Vendor-Credits-08-30)).
* **[Pitch Black Recovery Project (PBRP)](https://t.me/rmx3171important/406):** For the Realme UI 1.0 custom recovery tree.
* **MediaTek & Realme Moon Community:** For testing, toolchains, and feedback.

---

<a id="technical-docs"></a>
## 📖 Deep Technical Documentation

> [!NOTE]
> For the complete reverse-engineering journal detailing the MediaTek SurfaceFlinger IPC fixes, smali register layouts, and GMS signature reconciliation, read [**`FINAL_RELEASE_SUMMARY.md`**](./FINAL_RELEASE_SUMMARY.md).

For detailed post-mortems and targeted subsystem investigations:
* 📄 **[LiveDisplay & SurfaceFlinger Color Calibration Post-Mortem](./docs/known_issue_display_color.md):** Analysis of MT6768 MDP hardware composer constraints, Transaction 1015 corruption, and desaturation resolution.
* 📄 **[GMS Split-APK Self-Update & YouTube Spoofing Post-Mortem](./docs/known_issue_gms_update_youtube.md):** Deep-dive into Android 10 `PackageManagerService` signature verification, split-APK reconciliation, and package cert spoofing.

---

<div align="center">
Maintained with ❤️ by <b>omi4real</b>
</div>
