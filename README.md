# 色んな開発現場で使えるWindows向けの汎用起動処理バッチのテンプレ

## 前提条件

- WSLにUbuntuが入っていること
- MSYS2がインストールされており、MSYS2にzshが入っていて使えること

## 確認環境

- msys2-x86_64-20260322
- Windows 11 Pro
- WSL 2.6.3.0
- Ubuntu 24.04.4 LTS

## 使い方

1. `run_zsh.cmd`をMSYS2のインストールルートパスに置く
2. `log`フォルダをデスクトップ辺りに配置し、`start-wsl-services.bat`の`"/C/path/to/daily.sh"`のパスを直す
3. バッチ類を適当な場所に配置し、`startup.bat`のショートカットを`shell:startup`に貼っておくと起動時に日報作成やWSLのサービス起動が出来るようになる
4. スリープや休止から復帰するとWSLのサービスが死んでいるので`restart.bat`を蹴って叩き起こすとよい

## 弄り方

- 動かすサービスを増やす場合
  - `start-wsl-services.bat`に開始コマンドを足す
- スタートアップでやることを増やす場合
  - `startup.bat`に適当に書く
- スリープや休止から復帰した時に何かしたい場合
  - `restart.bat`に適当に書く
