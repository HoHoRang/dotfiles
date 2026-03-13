#!/bin/bash
# 05_tmux.sh - TPM 및 tmux 플러그인 설치
set -e

echo "🖥️  [5/6] tmux 플러그인 설치 시작..."

# TPM 설치
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
  echo "  → TPM 설치 중..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo "  ✅ TPM 설치 완료"
else
  echo "  → TPM 이미 설치됨, 건너뜀"
fi

# 플러그인 자동 설치
echo "  → tmux 플러그인 설치 중..."
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins"
tmux start-server \; set-environment -g TMUX_PLUGIN_MANAGER_PATH "$HOME/.tmux/plugins/"
~/.tmux/plugins/tpm/bin/install_plugins

echo "✅ tmux 플러그인 설치 완료"
