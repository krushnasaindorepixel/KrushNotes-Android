#!/usr/bin/env bash
set -e
echo "Building Krush Notes Class 10 SSC APK..."
if [ -f "./gradlew" ]; then
  chmod +x ./gradlew
  ./gradlew assembleDebug assembleRelease
else
  gradle assembleDebug assembleRelease
fi
echo ""
echo "APK Ready:"
echo "  Debug:   app/build/outputs/apk/debug/app-debug.apk"
echo "  Release: app/build/outputs/apk/release/app-release.apk"
