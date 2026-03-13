#!/bin/bash
# 03_stow.sh - Stow로 dotfiles 심볼릭 링크 생성

set -e

DOTFILES="$HOME/dotfiles"

echo "🔗 [3/5] Stow 심볼릭 링크 설정 시작..."

cd "$DOTFILES"

stow_pkg() {
  local pkg=$1
  shift
  local targets=("$@")

  if [ ! -d "$DOTFILES/$pkg" ]; then
    echo "  → [$pkg] 디렉토리 없음, 건너뜀"
    return
  fi

  echo "  → [$pkg] 충돌 파일 제거 중..."
  for target in "${targets[@]}"; do
    rm -rf "$target"
  done

  echo "  → [$pkg] stow 적용 중..."
  stow "$pkg"
}

stow_pkg git "$HOME/.gitconfig" "$HOME/.gitconfig-aiv" "$HOME/.gitignore_global" "$HOME/.stCommitMsg"
stow_pkg zsh "$HOME/.zshrc" "$HOME/.p10k.zsh"
stow_pkg ghostty "$HOME/.config/ghostty"
stow_pkg nvim "$HOME/.config/nvim"
stow_pkg claude "$HOME/.claude"
stow_pkg hammerspoon "$HOME/.hammerspoon"
stow_pkg tmux "$HOME/.tmux.conf"

echo "✅ Stow 심볼릭 링크 설정 완료"
