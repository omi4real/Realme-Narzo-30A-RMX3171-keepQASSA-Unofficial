# KNOWN ISSUE — GMS cannot update + patched YouTube crashes (RMX3171)

> **Status:** FIXED IN SHIPPING ROM VIA OPTIONAL MAGISK MODULE
> **Affected ROM:** KeepQassa Sisu v2.4 Vanilla — RMX3171 port
> **Workaround artifact:** `output/N30A_GMS_UpdateFix_Magisk.zip`
> **Canonical source tree (2026-10-06):** `scratch/services_v2_tree/smali/com/android/server/pm/PackageManagerService.smali` (old `services_clean` deprecated — boot hang)

---

## 1. Symptoms

1. Updating **Google Play services** from Play Store / Aurora Store fails:
   ```
   App installer
   Google Play services
   Conflicting package exists
   INSTALL_FAILED_DUPLICATE_PERMISSION:
   Package com.google.android.gms attempting to redeclare permission
   com.google.android.gms.WRITE_VERIFY_APPS_CONSENT
   already owned by com.google.android.gms
   ```
2. Installing the **youtube-morphe** (j-hc ReVanced) Magisk module makes YouTube crash, with:
   ```
   E GoogleApiManager: java.lang.SecurityException:
   GoogleCertificatesRslt: not whitelisted:
   pkg=com.google.android.youtube, sha1=add1ba3980f95b8b4df26f7d489c259738a86f88
   ```
   The equivalent YouTube Music module does **not** break YouTube Music.

## 2. Investigation / evidence

- LiteGapps is **not** at fault. The shipped `GmsCore.apk` in
  `LiteGapps-arm64-10.0-...-SuperIite.zip` is **byte-identical** (100,247,804 B) to the on-device
  `/system/product/priv-app/GmsCore/GmsCore.apk`, and both are genuine Google-signed:
  `SHA-256 f0fd6c5b…db83`, `SHA-1 38918a453d07199354f8b19af05ec6562ced5788`.
- The ROM `system.img` is genuinely vanilla — it contains no GmsCore/Phonesky at all.
- The same is true of Play Store (`Phonesky.apk`, Google-signed) and the patched YouTube APK
  (`ReVanced` cert, `SHA-1 cc36af8a…190a`).
- **But `/data/system/packages.xml` records all of them with the platform certificate:**
  - `cert index 0` = `KeepQASSA` (`SHA-1 AD:D1:BA:39:80:F9:5B:8B:4D:F2:6F:7D:48:9C:25:97:38:A8:6F:88`)
  - `cert index 7` = Google (`38:91:8A:45:…:57:88`)
  - `com.google.android.gms`, `com.android.vending`, `com.google.android.gsf`,
    `com.google.android.youtube` all reference **index 0** (KeepQASSA), not their real signer.
  - 114 packages are recorded against index 0 and 84 against index 1 — the ROM's
    platform signature spoofing layer is very broad.

### Root cause

The ROM's framework signature-spoofing layer makes `PackageManager` treat privileged/system
components as **platform-signed (KeepQASSA)** regardless of the real APK certificate. Two
consequences:

- **GMS update:** `PackageManagerService.preparePackageLI()` reconciles a declared permission
  against its existing owner. It compares the update's real (Google) signing details with the
  recorded (KeepQASSA) signing details of the installed GMS, fails both `checkCapability()`
  directions, and throws `INSTALL_FAILED_DUPLICATE_PERMISSION`. The existing signature-match
  spoof patches (compareSignatures/matchSignaturesCompat) do **not** cover this `SigningDetails.checkCapability()` path.
- **YouTube:** GMS' own `GoogleCertificates` whitelist reads YouTube's framework-reported
  signature — which is the KeepQASSA platform cert — and rejects the call. (A patched app is not
  Google-signed in any case; the Music module simply does not make that specific GMS call.)

## 3. Fix — `N30A_GMS_UpdateFix_Magisk.zip`

Three targeted patches in `services.jar` → `com.android.server.pm.PackageManagerService`:

1. **`preparePackageLI()` permission reconciliation** — when the existing permission owner has the
   *same package name* as the package being installed, accept instead of throwing
   `INSTALL_FAILED_DUPLICATE_PERMISSION`.

   ```smali
   :cond_30
   iget-object v3, v13, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;
   invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
   move-result v15
   ```

2. **`preparePackageLI()` update-signature check** — the framework compares the update's Google
   signature against the recorded platform signature via `SigningDetails.checkCapability()` and
   throws `INSTALL_FAILED_UPDATE_INCOMPATIBLE` ("New package has a different signature"). Allow
   updates for `com.google.*` and `com.android.vending` through this gate.

   ```smali
   :cond_43
   const-string v3, "com.google."
   invoke-virtual {v7, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
   move-result v3
   if-nez v3, :goto_24
   const-string v3, "com.android.vending"
   invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
   move-result v3
   if-nez v3, :goto_24
   ```

3. **`assertPackageIsValid()` duplicate-package gate** — the update's scan reported
   `INSTALL_FAILED_DUPLICATE_PACKAGE` ("already installed. Skipping duplicate.") because the
   replace scan flag was not honoured for the preinstalled GMS. Allow Google packages past this
   gate.

   ```smali
   move-result v7
   const-string v0, "com.google."
   invoke-virtual {v8, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
   move-result v0
   if-nez v0, :goto_3
   if-nez v7, :cond_7
   goto :goto_3
   ```

4. **`generatePackageInfo()` Google-cert spoof** — IMPORTANT CORRECTION: apply this **only** to the
   *system* Google packages (`com.google.android.gms`, `com.android.vending`,
   `com.google.android.gsf`). Do **NOT** spoof `com.google.android.youtube` or
   `com.google.android.apps.youtube.music`: the framework already records their real signers
   (YouTube = Google `24:bb:24…`, YouTube Music = `CN=ytmusic`, SHA-1 `afb0fed5…`), and overriding
   them with the generic `CN=Android` cert makes GMS' `GoogleCertificates` check return
   `not allowed`, crashing the apps and breaking Google sign-in.

   ```smali
   const-string/jumbo v0, "com.google.android.gms"
   invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
   move-result v0
   if-nez v0, :cond_do_clear_debug
   const-string/jumbo v0, "com.android.vending"
   ...
   const-string/jumbo v0, "com.google.android.gsf"
   ...
   ```

   Result: patched YouTube works (module), YouTube Music no longer crashes, and Google account
   sign-in completes (the wrong spoof had also been breaking the sign-in certificate handshake).

> **Note on `pm install -r`:** the old `pm` command-line path also hits the scan gate; with patch 3
> in place it now passes too. Verified end-to-end: Google Play services updated from
> `17.7.86` → `26.34.36` via a split-APK install session (Play Store logged *"Asset module
> broadcast after update successful"*), and patched YouTube launches without the previous
> `NoSuchMethodError` (it required GMS ≥ the API added after 2021).

### Install (Magisk v20+)

```bash
adb push output/N30A_GMS_UpdateFix_Magisk.zip /data/local/tmp/
adb shell magisk --install-module /data/local/tmp/N30A_GMS_UpdateFix_Magisk.zip
adb reboot
```

### Verify after reboot
```bash
adb shell md5sum /system/framework/services.jar     # expect 64167a79a571003dab46b282c3310386
# then open Aurora/Play Store and update Google Play services
```

### Rollback (if the device does not boot)
In recovery (or via `adb` while booted normally):
```bash
adb shell rm -rf /data/adb/modules/n30a_gms_updatefix
# or create the disable flag from recovery:
#   touch /data/adb/modules/n30a_gms_updatefix/disable
```
Then reboot.

## 4. Artifact & checksums

| Field | Value |
|---|---|
| Module zip | `output/N30A_GMS_UpdateFix_Magisk.zip` |
| Module size | 4,996,474 B |
| Module MD5 | `bac3a0d746ab18632ef02ce6abbfff2c` |
| Patched jar (final) | `output/services_patched_gmsfix.jar` |
| Jar MD5 (final) | `9ee69f25c7c2428821d1e9f7586fbbd1` |
| Baked ROM ZIP MD5 | `6311c96738905223958097fd0620a2fb` |
| Baked ROM ZIP SHA-256 | `15c1f6216e3d82efeaa9e6d4b5348e9a936af8a41b8903342586e227dfd4cf77` |
| Module source | `/tmp/opencode/n30a_gms_updatefix/` |

## 5. Permanent fix for next ROM build

Rebuild `services.jar` from the (already patched) canonical tree
`scratch/services_v2_tree/` (2026-10-06: replaces the deprecated `services_clean`) and stage it into `system.img` at
`/system/framework/services.jar`, then remove the module requirement. The two
edits are documented above and already present in the tree.

> **2026-09-27 CORRECTION:** the current `scratch/services_clean/` tree no longer
> matches the shipped v1 jar and contains additional unverified rewrites that
> cause a boot hang (verified twice). Build from
> `/tmp/opencode/rmx3171/sv1_tree/` (decode of `output/services_patched_gmsfix.jar`)
> instead; the shipping v2 jar is `output/services_patched_gmsfix_v2.jar`.

## 6. Addendum 2026-09-27 — Play Store (com.android.vending) could not self-update

1. **Symptom:** the Play Store app itself never updated (stuck on
   `19.5.13-all [0] [PR] 303545793`), with no user-visible error.
2. **Reproduction:** opening *Play Store → Settings → About → Play Store version*
   makes Play Store download server version `83521940`, but the install session
   is rejected by `PackageManager`:
   ```
   W PackageManager: com.android.server.pm.PackageManagerException:
     Application package com.android.vending already installed.  Skipping duplicate.
   ```
3. **Root cause:** the v1 `services.jar` fix whitelisted only the `com.google.`
   prefix at the `assertPackageIsValid` duplicate-package gate. Play Store is
   `com.android.vending`, so it still hit the duplicate gate.
4. **Fix (v2):** on the known-good v1 tree, the duplicate gate now
   unconditionally allows the replacement scan (`goto :goto_3`) instead of
   throwing for non-`com.google.` packages. Rebuilt `services.jar`
   (MD5 `6ace8ade4ba3cd49e2cdd04942de118d`), baked into `system.img` and shipped
   via the updated Magisk module.
5. **Verification:** Play Store self-updated to `versionCode=83521940`
   (`versionName=35.2.19-21`); the duplicate-package error no longer appears.
   Note the installed Play Store runs 32-bit (`primaryCpuAbi=armeabi-v7a`)
   because the GApps base APK is 32-bit; it functions normally.
