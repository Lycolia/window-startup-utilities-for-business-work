# WSL側の基本設定

日報生成ツールの配置を追記する必要あり

## zshなど、使うツール類のインストール

```bash
touch .hushlogin
sudo apt update && sudo apt upgrade
sudo apt update -y
sudo apt upgrade -y
# 基礎環境の導入
sudo apt install -y \
    zsh \
    ssh \
    net-tools \
    traceroute \
    unzip \
    nginx \
    git \
    mysql-client

# chsh
sudo apt -y install unzip traceroute
chsh -s $(which zsh)

# dotfiles
wget https://github.com/Lycolia/my-dotfiles/archive/refs/heads/main.zip
unzip main.zip
cp -R my-dotfiles-main/. .
rm -Rf my-dotfiles-main main.zip
```

## systemdの有効化

```bash
cat <<'EOF' | sudo tee /etc/wsl.conf
[boot]
systemd=true
EOF
```

## Dockerのインストール

```bash
# Docker
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt -y update
sudo apt -y install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

sudo apt -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# sudo緩和
sudo usermod -aG docker $USER
```

## nvmのインストール

1. 以下を流す
   ```bash
   # Node.js @ nvm
   export NVM_DIR="$HOME/.nvm" && (
     git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
     cd "$NVM_DIR"
     git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
   ) && \. "$NVM_DIR/nvm.sh"
   nvm install --lts
   ```
1. ~/.zshrcを開きnvm用のコメントを外す

## keychainのインストール

鍵は適当に作っておく。

1. 以下を流す
   ```bash
   sudo apt install keychain
   ```
2. keychainを叩いて設定を作る
   ```bash
   keychain -q --nogui --agents ssh,gpg --quick <GitHub SSH秘密鍵のパス> <AWS SSH秘密鍵のパス> <GPG鍵のkeyid>
   ```
3. .zshrcに次の行を追加。

   ```bash
   export GPG_TTY=$(tty)

   keychain -q --nogui --agents ssh,gpg --quick <GitHub SSH秘密鍵のパス> <AWS SSH秘密鍵のパス> <GPG鍵のkeyid>
   source $HOME/.keychain/`hostname`-sh
   ```

4. GPP Agent周りの設定

   ```bash
   cat <<'EOF' | tee ~/.gnupg/gpg-agent.conf
   ###+++--- GPGConf ---+++###
   default-cache-ttl 34560000
   max-cache-ttl 34560000
   EOF

   echo 'keyid-format LONG' > ~/.gnupg/gpg.conf
   ```

## Gitを設定する

#### GPG鍵

```bash
gpg --full-generate-key
```

### 設定コマンド

```bash
# ユーザー名
git config --global user.name "Foo Bar"
# メアド
git config --global user.email foo@example.com
# 改行コードの LF 強制
git config --global core.autocrlf false
# UTF8 文字がエスケープされるのを防止する
# 設定してないと "\343\202\275" のような表示になる
git config --global core.quotepath false
# コードエディタ
git config --global core.editor nano
# コミット時に使う gpg 署名鍵
git config --global user.signingkey XXXXXXXXXXXXXXXX
# コミット時に gpg 署名する
git config --global commit.gpgsign true
# git init したときのメインブランチ
git config --global init.defaultbranch main
# push時のデフォルトブランチ
# 設定しておくと初回 push 時のオプションが不要になる
# もし別ブランチにpushする場合は注意が必要
git config --global push.default current
# pull時のデフォルトブランチ
git config --global pull.default current
# pull時にrebaseさせない
git config --global pull.rebase false
# pull/fetchで削除されたリモートブランチ情報をローカルから消す
git config --global fetch.prune true
```
