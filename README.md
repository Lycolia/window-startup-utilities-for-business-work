# Windows Working Utilities

Windows + WSLを使った日々の業務環境を、手早く立ち上げるための個人用ユーティリティ集。

Windows起動後の定型処理、WSL上での日報ファイル作成、既定ブラウザの設定、録音、通知、モニター電源オフなどのユーティリティスクリプト。

## ディレクトリ構成

```
.
├── env/                         # Windowsの環境関連ファイル
│   ├── batches/                 # Windowsの各種自動化スクリプト
│   │   ├── startup.bat          # Windowsのstartupに放り込むやつ
│   │   ├── startup-wsl.sh       # starup.batから呼ぶWSLの起動処理
│   │   ├── set-default-edge.ps1 # Edgeを既定アプリに設定（起動時にChromeに変更されるようなシーンで上書き）
│   │   ├── SFTA.ps1             # set-default-edge.ps1の依存（標準ブラウザ強制変更スクリプト）
│   │   ├── rec.ps1              # 会議録音とかをする奴 → https://blog.lycolia.info/0518
│   │   ├── toast.ps1            # コマンドラインからWindowsのトースト通知を出す奴
│   │   └── MonitorPowerOff.ps1  # モニターの電源を切る奴
│   └── documents/
│       └──ubuntu.png            # Windows Terminal用のアイコン
├── manual/
│   ├── setup-Windows.md     # Windowsのセットアップ手順
│   └── setup-WSL.md         # WSL / Ubuntuのセットアップ手順
├── wksp/
│   ├── daily.sh             # 日報の作成
│   └── tool/                # 日報のタイムラインから工数を出すツール
└── run_zsh.cmd              # MSYS2のzsh起動用ラッパー
```

## セットアップ

1. [Windowsのセットアップ手順](manual/setup-Windows.md)を参考に、Windows側のセットアップを行う
2. [WSLのセットアップ手順](manual/setup-WSL.md)を参考に、WSL側のセットアップを行う
3. `batches/startup.bat`と`batches/startup-wsl.sh`内のパスやコマンドを自分の環境に合わせて変更する
4. `batches/startup.bat`のショートカットを`shell:startup`に配置する

# 説明書き

## rec.ps1

`ffmpeg`と`virtual-audio-capturer`が必要。

詳細は<https://blog.lycolia.info/0518>を参照。

## 利用前に変更する箇所

少なくとも次の値を確認すること。

- `C:\env\...`、`/mnt/c/env/...`、`/path/to/...`などの固定パス
- `startup-wsl.sh`の`aw-login`や起動対象サービス
- `daily.sh`のログ保存先とGitコミット動作
- `rec.ps1`の録音デバイス名と出力先
- `toast.ps1`の既定画像パス
- `run_zsh.cmd`のMSYS2インストール先

## 注意事項

- PowerShellスクリプトの一部は管理者権限を必要とする。cod
- 本リポジトリは個人環境向けです。別環境での動作は保証しません。
