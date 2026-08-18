#!/usr/bin/env bash

set -u

# aw-loginはaws sso loginを書いただけのシェルスクリプト
# echo "[startup] AWS SSO / ECR にログインします..."
# if ! aw-login; then
#     echo "[startup] aw-login に失敗しました。" >&2
#     exit 1
# fi

echo "[startup] 日次ログを作成します..."
if ! /path/to/wksp/daily.sh; then
    # git commit対象がない日などは非0になり得るが、開発環境の起動は続ける。
    echo "[startup] daily.sh は非0で終了しました。後続処理は続けます。" >&2
fi

# Docker起動やaws sso loginなどを行うのに使う
# echo "[startup] xxx を起動します..."
# if ! (
#     cd /path/to/xxx
#     ./up.sh
# ); then
#     echo "[startup] xxx/up.sh に失敗しました。" >&2
#     exit 1
# fi

echo "[startup] WSL側の起動処理が完了しました。"
