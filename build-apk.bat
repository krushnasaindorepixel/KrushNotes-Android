@echo off
echo Building Krush Notes Class 10 SSC APK...
if exist gradlew.bat (
  call gradlew.bat assembleDebug assembleRelease
) else (
  gradle assembleDebug assembleRelease
)
echo.
echo APK Ready:
echo   Debug:   app\build\outputs\apk\debug\app-debug.apk
echo   Release: app\build\outputs\apk\release\app-release.apk
pause
