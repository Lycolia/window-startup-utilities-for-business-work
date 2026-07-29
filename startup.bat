@echo off

start ubuntu

rem 早く上がりすぎると権限変更で負ける？ので待機
timeout 5
start powershell -NoProfile -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File \"%~dp0set-default-edge.ps1\"' -Verb RunAs"

echo "何かキーを押すとログフォルダを作成し、VSCodeとEdgeを起動します。"
wsl /home/hoge/wksp/daily.sh
pause
start code
start "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --profile-directory=Default
