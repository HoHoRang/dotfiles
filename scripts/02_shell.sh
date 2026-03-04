#!/bin/bash
# 02_shell.sh - Oh My Zsh 및 Powerlevel10k 설치

set -e

echo "🐚 [2/5] 쉘 설정 시작..."

# Oh My Zsh 설치
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "  → Oh My Zsh 설치 중..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "  → Oh My Zsh 이미 설치됨"
fi

# Powerlevel10k 테마 설치
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  echo "  → Powerlevel10k 설치 중..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
else
  echo "  → Powerlevel10k 이미 설치됨"
fi

echo "✅ 쉘 설정 완료"
