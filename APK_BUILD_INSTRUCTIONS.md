# Krush Notes — Native Android APK Build Instructions

## Overview
**Krush Notes** is a native Android application built with **Kotlin** and **Jetpack Compose (Material 3)** for Class 10 Maharashtra State Board (SSC) students. It is 100% free, requires no login, contains zero ads, and stores offline chapters, bookmarks, quiz scores, and PDF notes locally using Android **DataStore** and internal file storage (`filesDir`).

## Device Optimization
- **minSdk:** 24 (Android 7.0+)
- **targetSdk / compileSdk:** 35 (Android 15)
- **Memory & Storage:** Lightweight Compose UI with R8 shrinking enabled (`isMinifyEnabled = true`, `isShrinkResources = true`), keeping release APK compact (~4–6 MB) and smooth on phones with **4GB RAM / 64GB storage**.

---

## Option 1: Build APK using Android Studio (Windows & macOS)
1. Download or export the `/android` folder from Krush Notes.
2. Open **Android Studio** (Ladybug 2024.2 or newer).
3. Click **File → Open** and select the `android/` directory.
4. Wait for Gradle Sync to finish downloading dependencies (Kotlin `2.0.21`, Compose BOM `2024.10.01`, DataStore `1.1.1`).
5. Connect an Android phone via USB (with **USB Debugging** enabled) or start an Android Emulator.
6. To install directly: click **Run ▶** (`Shift + F10`).
7. To generate a standalone installable `.apk`:
   - Menu: **Build → Build Bundle(s) / APK(s) → Build APK(s)**.
   - Locate the generated APK at:
     `android/app/build/outputs/apk/debug/app-debug.apk`

---

## Option 2: Build APK from Terminal (Command Line)
Ensure **JDK 17** and **Android SDK Platform 35** are installed (`ANDROID_HOME` configured):

### Debug APK (Install directly on Android phone)
```bash
cd android
./gradlew assembleDebug
```
Output APK: `app/build/outputs/apk/debug/app-debug.apk`

### Release APK (R8 Minified & Resource Shrunk)
```bash
cd android
./gradlew assembleRelease
```
Output APK: `app/build/outputs/apk/release/app-release.apk`

### Install onto Connected Phone via ADB
```bash
adb install -r app/build/outputs/apk/debug/app-debug.apk
```

---

## Option 3: Install Cross-Platform App Immediately (Android, Windows, Mac)
Krush Notes also ships as an installable **Offline Progressive Web App (PWA)** running identically on Windows, macOS, and Android Chrome/Edge:
- Open the Krush Notes web app in Chrome or Edge.
- Click **"Install App"** in the header or browser address bar to run standalone offline on PC or Android without waiting for an APK build.
