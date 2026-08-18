@echo off
setlocal

rem Wait before changing the default browser to avoid an early-start race.
timeout /t 5 /nobreak >nul
start powershell -NoProfile -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File \"%~dp0set-default-edge.ps1\"' -Verb RunAs"

rem Starting an interactive zsh loads keychain. ssh-add verifies that the keys are ready.
echo Enter the keychain passphrase when prompted.
wsl.exe -e zsh -lic "ssh-add -l >/dev/null"
if errorlevel 1 (
    echo keychain did not load an SSH key. Startup has been stopped.
    pause
    exit /b 1
)

rem Edge must be running before AWS SSO opens its login page.
start "" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --disable-features=msFeatureGroupNewLookAndFeelHoldout

rem Run AWS SSO/ECR login, daily.sh, and openlogi-api/up.sh in sequence.
wsl.exe -e zsh -lic "bash /mnt/c/env/tools/batch/startup-wsl.sh"
if errorlevel 1 (
    echo WSL startup failed. VS Code will not be started.
    pause
    exit /b 1
)

start code

endlocal
