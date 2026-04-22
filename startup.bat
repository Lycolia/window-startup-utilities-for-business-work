rem OSのスタートアップ時に各種処理を行うやつ

@echo off

rem Dockerとかのサービスを上げる用
call start-wsl-services.bat

rem Ubuntuのkeychainを起動時に打ち込んでおくため
rem （VSCode起動時に多窓でターミナルが上がるとkeychainが壊れて面倒なため、このタイミングでやっておく）
start ubuntu

rem 日報作成用
call "C:/env/msys64/run_zsh.cmd" "/C/path/to/daily.sh"

rem エラーメッセージとかの確認用
pause