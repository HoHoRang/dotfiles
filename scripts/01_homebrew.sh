#!/bin/bash
# 01_homebrew.sh - Homebrew 설치 및 패키지 설치

set -e

echo "🍺 [1/5] Homebrew 설정 시작..."

# Homebrew 설치
if ! command -v brew &>/dev/null; then
  echo "  → Homebrew 설치 중..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Apple Silicon 환경변수 즉시 적용
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "  → Homebrew 이미 설치됨: $(brew --version | head -1)"
fi

# Brewfile로 패키지 일괄 설치
BREWFILE="$HOME/dotfiles/Brewfile"
if [ -f "$BREWFILE" ]; then
  echo "  → Brewfile로 패키지 설치 중..."
  brew bundle --file="$BREWFILE"
else
  echo "  → Brewfile 없음. 필수 패키지만 설치..."
  brew install stow nvim
  brew install --cask font-jetbrains-mono-nerd-font ghostty
fi

echo "✅ Homebrew 설정 완료"
