# Windows側の設定

## Windows Update

Windows Updateを行う。40分程見ておくとよい。BIOSのアップデートが長く、これだけで20分ほどかかる。

## Windowsの設定

Windowsの設定で行う各種設定。

1. システム＞ディスプレイでスケーリングを100%にする
2. システム＞クリップボードでクリップボードの履歴を有効化する
3. Bluetoothとデバイス＞キーボードでPrintScreenを使用して画面キャプチャを開くをOFF
4. Bluetoothとデバイス＞タッチパッドで、マウスの接続時にタッチパッドをオフにしないをOFF
5. Bluetoothとデバイス＞タッチパッドで、タップ・スクロールとズーム・３本指ジェスチャ・４本指ジェスチャを**右クリックを残して**、全て無効化
6. Bluetoothとデバイス＞タッチパッド＞高度なジェスチャで全て無効化
7. 個人用設定＞色でモードをカスタムにし、Windowsをダーク、アプリをライトにする
8. 個人用設定＞テーマでゴミ箱を非表示にする（前にエクスプローラーにピン止めしておくこと、内容はその他の設定で後述）
9. 個人用設定＞動的ライティングを全て無効化
10. 個人用設定＞ロック画面でトリビアやヒントを表示しないようにし、ロック画面の背景を表示するようにする
11. 個人用設定＞スタートで余計なものを全てオフ
12. アプリ＞インストールされているアプリで不要なアプリケーションを軒並み消す
13. アプリ＞スタートアップで余計なものをすべてOFF
14. アプリ＞アプリの詳細設定でアプリをアーカイブするをOFF
15. アプリ＞アプリの詳細設定＞アプリ実行エイリアスでPython関係をOFFにする
16. アプリ＞再開で全てオフ
17. 時刻と言語＞言語と地域＞Microsoft IME＞全般
18. スペースを常に半角
19. 文字種の種類とセットでひらがな、全角カタカナ、ローマ字を有効にする
20. 時刻と言語＞入力＞入力インサイトで入力インサイトをオフにする

### 外部モニタ設定

外部モニタをつないだ時に行うWindowsの設定。

1. システム＞ディスプレイで「表示画面を拡張する」にする
2. 個人用設定＞タスクバーで複数のディスプレイを使用する場合にタスクバーアプリを表示する場所を「開かれているウィンドウのタスクバー」にする
3. 正面モニタをメインモニタとし本体モニタを切断する

## OneDriveを消す

OneDriveをアンインストールする。

## その他の設定

1. ドライブのプロパティからインデックスを外す
2. コンパネ＞電源オプションで電源オプションでパフォーマンスが最大になるようにする
3. コンパネ＞電源オプション＞電源ボタン
   1. 高速スタートアップの無効化
   2. 休止状態の有効化
   3. バッテリー駆動時
      1. 電源ボタン押下：スリープ
      2. カバーを閉じたとき：スリープ
   4. 電源接続時
      1. 電源ボタン押下：スリープ
      2. カバーを閉じたとき：何もしない
4. Windows 11のエクスプローラーの右クリックメニューを従来のWindowsと同じ表示形式にする
   1. `reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve`
5. 新しいメモ帳を無効化する
   1. 新しいメモ帳をアンインストール
   2. Win+Rでファイル名を指定して実行を出し、notepadを叩く
   3. 「新しいバージョンのメモ帳が利用可能です」「インストール」とか帯が出るので帯の右にある×ボタンを押して消す
   4. タスクバーにいるメモ帳を右クリックしてスタートにピン留めする
   5. この作業を行い、notepadと入力して起動、noteと入力して起動、nと入力して起動のように繰り返すことで、以後の起動が楽になる
6. テキストファイルの新規作成を可能にする
   1. 次の内容のレジストリを登録する

      ```reg
      [HKEY_CLASSES_ROOT\.txt\ShellNew]
      "NullFile"=""

      [HKEY_CLASSES_ROOT\txtfilelegacy]
      "FriendlyTypeName"="テキストファイル"
      ```

7. ゴミ箱をデスクトップから消し、エクスプローラーのピン止めに移動する
8. ゴミ箱のプロパティを開き、削除時確認を有効にする
9. フォルダオプションの全般タブを開き、エクスプローラーで開くを「PC」に設定し、プライバシーを全てOFF
10. フォルダーオプションの表示タブを開き
11. 開いてるフォルダーまで展開 on
12. 隠しファイルを表示 on
13. 登録されている拡張子は表示しない off
14. 同期プロバイダーの通知を表示する off
15. shell:startupを開きstartup.batのショートカットを作る
16. .ps1ファイルを使えるようにするために、Powershellを管理者権限で開き以下を流す

    ```powershell
    Set-ExecutionPolicy RemoteSigned
    ```

# Windows側アプリケーションの導入

## A5M2のインストール

[A5:SQL Mk-2 - フリーのSQLクライアント/ER図作成ソフト (松原正和)](https://a5m2.mmatsubara.com/)から落としてやる

## Chocolateyのインストール

Powershellを管理者権限で起動して以下を流す。

```pwsh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

## WSL2とUbuntuのインストール

1. 管理者権限のターミナルから以下を流す
   ```cmd
   wsl.exe --install
   ```
1. MicrosoftStoreからUbuntuをインストールする

## VSCodeのインストール

1. [公式サイト](https://code.visualstudio.com/)からインストーラーを落としてインストール
2. `HKEY_CURRENT_USER¥Software¥Microsoft¥Windows¥CurrentVersion¥App Paths¥code.exe`を消す
3. 拡張機能を入れる
   ```bash
   code --install-extension 13xforever.language-x86-64-assembly
   code --install-extension 42crunch.vscode-openapi
   code --install-extension anthropic.claude-code
   code --install-extension bmewburn.vscode-intelephense-client
   code --install-extension dbaeumer.vscode-eslint
   code --install-extension docker.docker
   code --install-extension eamodio.gitlens
   code --install-extension esbenp.prettier-vscode
   code --install-extension golang.go
   code --install-extension gruntfuggly.todo-tree
   code --install-extension jebbs.plantuml
   code --install-extension jock.svg
   code --install-extension lokalise.i18n-ally
   code --install-extension ms-azuretools.vscode-containers
   code --install-extension ms-azuretools.vscode-docker
   code --install-extension ms-ceintl.vscode-language-pack-ja
   code --install-extension ms-vscode-remote.remote-containers
   code --install-extension ms-vscode-remote.remote-wsl
   code --install-extension ms-vscode.powershell
   code --install-extension shinyypig.md-paste-image
   code --install-extension redhat.vscode-commons
   code --install-extension redhat.vscode-yaml
   code --install-extension robberphex.php-debug
   code --install-extension shd101wyy.markdown-preview-enhanced
   code --install-extension swordev.phpstan
   code --install-extension vscode-icons-team.vscode-icons
   ```
4. 設定を書く
   1. settings.json
      ```json
      {
        "terminal.integrated.defaultProfile.windows": "MSYS2",
        "terminal.integrated.profiles.windows": {
          "MSYS2": {
            "overrideName": true,
            "path": ["C:\\env\\msys64\\msys2_shell.cmd"],
            "args": [
              "-defterm",
              "-here",
              "-use-full-path",
              "-no-start",
              "-mingw64",
              "-shell",
              "zsh"
            ]
          },
          "PowerShell": {
            "source": "PowerShell",
            "icon": "terminal-powershell"
          },
          "Command Prompt": {
            "path": [
              "${env:windir}\\Sysnative\\cmd.exe",
              "${env:windir}\\System32\\cmd.exe"
            ],
            "args": [],
            "icon": "terminal-cmd"
          }
        },
        "terminal.integrated.defaultProfile.linux": "zsh",
        "terminal.integrated.profiles.linux": {
          "zsh": {
            "path": "zsh"
          }
        },
        "terminal.integrated.automationProfile.windows": {
          "path": "${env:windir}\\System32\\cmd.exe",
          "args": [],
          "icon": "terminal-cmd"
        },
        "terminal.integrated.allowChords": false,
        "terminal.integrated.commandsToSkipShell": [
          "-workbench.action.quickOpenView",
          "-workbench.action.terminal.focusFind"
        ],
        "workbench.startupEditor": "newUntitledFile",
        "workbench.iconTheme": "vscode-icons",
        "workbench.editor.decorations.badges": false,
        "workbench.editor.decorations.colors": false,
        "workbench.tree.enableStickyScroll": false,
        "workbench.layoutControl.enabled": false,
        "workbench.editor.empty.hint": "hidden",
        "files.eol": "\n",
        "files.trimTrailingWhitespace": true,
        "files.insertFinalNewline": true,
        "scm.showIncomingChanges": "never",
        "scm.showOutgoingChanges": "never",
        "git.autorefresh": true,
        "git.autoStash": true,
        "git.suggestSmartCommit": false,
        "git.mergeEditor": false,
        "git.openRepositoryInParentFolders": "never",
        "remote.autoForwardPortsSource": "hybrid",
        "diffEditor.ignoreTrimWhitespace": false,
        "diffEditor.renderGutterMenu": false,
        "explorer.confirmDragAndDrop": false,
        "editor.codeActionsOnSave": {
          "source.fixAll.eslint": "explicit"
        },
        "editor.stickyScroll.enabled": false,
        "[markdown]": {
          "editor.tabSize": 4,
          "editor.defaultFormatter": "esbenp.prettier-vscode",
          "editor.formatOnSave": true
        },
        "php.validate.run": "onSave",
        "vsicons.dontShowNewVersionMessage": true,
        "pasteImage.path": "${currentFileDir}/${currentFileNameWithoutExt}.assets",
        "todo-tree.filtering.excludeGlobs": ["**/node_modules/**/*"],
        "todo-tree.highlights.customHighlight": {
          "TODO": {
            "foreground": "#f8ff96",
            "type": "text-and-comment"
          },
          "FIXME": {
            "foreground": "#ff9696",
            "type": "text-and-comment"
          }
        },
        "todo-tree.general.tags": ["TODO", "FIXME"],
        "todo-tree.regex.regex": "(//|#|<!--|/\\*|^\\s*\\*)\\s*($TAGS)",
        "gitlens.currentLine.format": "${author, }${date}${' via 'pullRequest}${ • message|50?}",
        "gitlens.statusBar.format": "${author}, ${date}${' via 'pullRequest}",
        "gitlens.statusBar.tooltipFormat": "${avatar} &nbsp;__${author}__, ${date}${' via 'pullRequest}\n\n${message}${\n\n---\n\nfootnotes}\n\n${commands}",
        "gitlens.hovers.detailsMarkdownFormat": "${avatar} &nbsp;__${author}__, ${date}${' via 'pullRequest}\n\n${message}${\n\n---\n\nfootnotes}\n\n${commands}",
        "gitlens.views.formats.stashes.description": "${date}",
        "gitlens.views.formats.commits.description": "${author, }${date}",
        "gitlens.defaultDateFormat": "YYYY-MM-DD",
        "terminal.integrated.shellIntegration.decorationsEnabled": "never",
        "security.workspace.trust.untrustedFiles": "open",
        "explorer.copyRelativePathSeparator": "/",
        "typescript.tsserver.log": "off",
        "gitlens.ai.experimental.generateCommitMessage.enabled": false,
        "redhat.telemetry.enabled": true,
        "chat.commandCenter.enabled": false,
        "gitlens.views.scm.grouped.views": {
          "commits": true,
          "branches": true,
          "remotes": true,
          "stashes": false,
          "tags": true,
          "worktrees": true,
          "contributors": true,
          "repositories": false,
          "searchAndCompare": false,
          "launchpad": false
        },
        "workbench.secondarySideBar.defaultVisibility": "hidden",
        "docker.extension.enableComposeLanguageServer": false,
        "workbench.localHistory.maxFileEntries": 500,
        "editor.acceptSuggestionOnCommitCharacter": false,
        "workbench.settings.showAISearchToggle": false,
        "gitlens.ai.enabled": false,
        "chat.agent.enabled": false,
        "remote.SSH.experimental.chat": false,
        "scm.showInputActionButton": false,
        "typescript.updateImportsOnFileMove.enabled": "always",
        "update.showReleaseNotes": false,
        "terminal.integrated.stickyScroll.enabled": false,
        "[dockercompose]": {
          "editor.insertSpaces": true,
          "editor.tabSize": 2,
          "editor.autoIndent": "advanced",
          "editor.quickSuggestions": {
            "other": true,
            "comments": false,
            "strings": true
          },
          "editor.defaultFormatter": "redhat.vscode-yaml"
        },
        "[github-actions-workflow]": {
          "editor.defaultFormatter": "redhat.vscode-yaml"
        },
        "update.mode": "manual",
        "files.associations": {
          "*.bats": "shellscript"
        }
      }
      ```
   2. keybindings.json
      ```json
      [
        {
          "key": "ctrl+shift+r",
          "command": "workbench.action.reloadWindow"
        },
        {
          "key": "alt+down",
          "command": "workbench.action.compareEditor.nextChange",
          "when": "textCompareEditorVisible"
        },
        {
          "key": "alt+up",
          "command": "workbench.action.compareEditor.previousChange",
          "when": "textCompareEditorVisible"
        },
        {
          "key": "ctrl+k enter",
          "command": "-workbench.action.keepEditor"
        },
        {
          "key": "ctrl+q",
          "command": "workbench.action.keepEditor"
        },
        {
          "key": "shift+enter",
          "command": "workbench.action.terminal.sendSequence",
          "args": {
            "text": "\u001b\r"
          },
          "when": "terminalFocus"
        }
      ]
      ```

## WindowsTerminalの設定

```json
{
  "$help": "https://aka.ms/terminal-documentation",
  "$schema": "https://aka.ms/terminal-profiles-schema",
  "actions": [
    {
      "command": "find",
      "id": "User.find"
    },
    {
      "command": {
        "action": "splitPane",
        "split": "auto",
        "splitMode": "duplicate"
      },
      "id": "User.splitPane.A6751878"
    },
    {
      "command": "paste",
      "id": "User.paste"
    },
    {
      "command": {
        "action": "copy",
        "singleLine": false
      },
      "id": "User.copy.644BA8F2"
    }
  ],
  "copyFormatting": "none",
  "copyOnSelect": false,
  "defaultProfile": "{17da3cac-b318-431e-8a3e-7fcdefe6d114}",
  "keybindings": [
    {
      "id": "User.find",
      "keys": "ctrl+shift+f"
    },
    {
      "id": "User.paste",
      "keys": "ctrl+v"
    },
    {
      "id": "User.splitPane.A6751878",
      "keys": "alt+shift+d"
    },
    {
      "id": "User.copy.644BA8F2",
      "keys": "ctrl+c"
    }
  ],
  "newTabMenu": [
    {
      "type": "remainingProfiles"
    }
  ],
  "profiles": {
    "defaults": {},
    "list": [
      {
        "colorScheme": "VSCode",
        "commandline": "ubuntu.exe",
        "cursorShape": "filledBox",
        "font": {
          "face": "Consolas",
          "size": 11
        },
        "guid": "{60b7923e-41aa-455c-bd33-03e5ccf277f9}",
        "hidden": false,
        "icon": "https://assets.ubuntu.com/v1/49a1a858-favicon-32x32.png",
        "name": "Ubuntu",
        "tabTitle": "Ubuntu"
      },
      {
        "commandline": "C:/Program Files/PowerShell/7/pwsh.exe",
        "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44b0}",
        "icon": "C:/Program Files/PowerShell/7/pwsh.exe",
        "name": "Windows PowerShell"
      },
      {
        "guid": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
        "hidden": false,
        "name": "\u30b3\u30de\u30f3\u30c9 \u30d7\u30ed\u30f3\u30d7\u30c8"
      },
      {
        "colorScheme": "VSCode",
        "commandline": "C:/env/msys64/msys2_shell.cmd -msys -defterm -here -use-full-path -no-start -shell zsh",
        "font": {
          "face": "Consolas",
          "size": 11
        },
        "guid": "{17da3cac-b318-431e-8a3e-7fcdefe6d114}",
        "icon": "C:/env/msys64/mingw64.ico",
        "name": "MINGW64 / MSYS2"
      }
    ]
  },
  "schemes": [
    {
      "background": "#1E1E1E",
      "black": "#000000",
      "blue": "#2472C8",
      "brightBlack": "#666666",
      "brightBlue": "#3B8EEA",
      "brightCyan": "#29B8DB",
      "brightGreen": "#23D18B",
      "brightPurple": "#D670D6",
      "brightRed": "#F14C4C",
      "brightWhite": "#E5E5E5",
      "brightYellow": "#F5F543",
      "cursorColor": "#FFFFFF",
      "cyan": "#11A8CD",
      "foreground": "#D4D4D4",
      "green": "#0DBC79",
      "name": "VSCode",
      "purple": "#BC3FBC",
      "red": "#CD3131",
      "selectionBackground": "#FFFFFF",
      "white": "#E5E5E5",
      "yellow": "#E5E510"
    }
  ],
  "themes": []
}
```

### ブラウザ拡張

- [Authenticator: 2FA Client](https://microsoftedge.microsoft.com/addons/detail/authenticator-2fa-client/ocglkepbibnalbgmbachknglpdipeoio)
- [React Developer Tools](https://microsoftedge.microsoft.com/addons/detail/react-developer-tools/gpphkfbcpidddadnkolkpfckpihlkkil)
- [Tampermonkey](https://microsoftedge.microsoft.com/addons/detail/tampermonkey/iikmkjmpaadaobahmlepeloendndfphd)
- [Checker Plus for Gmail](https://chromewebstore.google.com/detail/checker-plus-for-gmail/oeopbcgkkoapgobdbedcemjljbihmemj)
  - GMail通知用
