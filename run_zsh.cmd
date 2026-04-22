@echo off
set MSYSTEM=MSYS
set MSYS2_PATH_TYPE=inherit
set CHERE_INVOKING=enabled_from_arguments
C:\env\msys64\usr\bin\zsh.exe -l %*
