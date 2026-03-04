#!/bin/bash
# 03_stow.sh - Stow로 dotfiles 심볼릭 링크 생성

set -e

DOTFILES="$HOME/dotfiles"

echo "🔗 [3/5] Stow 심볼릭 링크 설정 시작..."

# 각 패키지별 충돌 파일 제거 후 stow
# 형식: "패키지명 | 제거할 실제 경로들..."
declare -A CONFLICTS=(
  ["git"]="$HOME/.gitconfig $HOME/.gitconfig-aiv $HOME/.gitignore_global $HOME/.stCommitMsg"
  ["zsh"]="$HOME/.zshrc $HOME/.p10k.zsh"
  ["ghostty"]="$HOME/.config/ghostty/config"
  ["nvim"]="$HOME/.config/nvim"
  ["claude"]="$HOME/.claude"
)

cd "$DOTFILES"

for pkg in "${!CONFLICTS[@]}"; do
  pkg_dir="$DOTFILES/$pkg"
  if [ ! -d "$pkg_dir" ]; then
    echo "  → [$pkg] 디렉토리 없음, 건너뜀"
    continue
  fi

  echo "  → [$pkg] 충돌 파일 제거 중..."
  for target in ${CONFLICTS[$pkg]}; do
    rm -rf "$target"
  done

  echo "  → [$pkg] stow 적용 중..."
  stow "$pkg"
done

echo "✅ Stow 심볼릭 링크 설정 완료"
