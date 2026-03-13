#!/bin/bash
# install.sh - dotfiles 설치 메인 스크립트
# 각 단계는 scripts/ 디렉토리의 개별 스크립트로 관리됨

set -e

DOTFILES="$HOME/dotfiles"
SCRIPTS="$DOTFILES/scripts"

# 사용법 출력
usage() {
  echo "Usage: $0 [step]"
  echo ""
  echo "  (인자 없음)   전체 설치 실행"
  echo "  homebrew      01_homebrew.sh - Homebrew 및 패키지 설치"
  echo "  shell         02_shell.sh    - Oh My Zsh, Powerlevel10k"
  echo "  stow          03_stow.sh     - dotfiles 심볼릭 링크"
  echo "  claude        04_claude.sh   - Claude Code 설치"
  echo "  tmux          05_tmux.sh     - Tmux Plugin 설치"
  echo ""
  echo "Example:"
  echo "  ./install.sh            # 전체 실행"
  echo "  ./install.sh stow       # stow 단계만 재실행"
  echo "  ./install.sh claude     # Claude Code만 설치"
}

# 개별 스크립트 실행 함수
run_step() {
  local script="$SCRIPTS/$1"
  if [ ! -f "$script" ]; then
    echo "❌ 스크립트를 찾을 수 없음: $script"
    exit 1
  fi
  bash "$script"
}

# 인자에 따라 특정 단계만 실행
case "${1:-}" in
homebrew) run_step "01_homebrew.sh" ;;
shell) run_step "02_shell.sh" ;;
stow) run_step "03_stow.sh" ;;
claude) run_step "04_claude.sh" ;;
tmux) run_step "05_tmux.sh" ;;

help | --help | -h) usage ;;
"")
  # 전체 실행
  run_step "01_homebrew.sh"
  run_step "02_shell.sh"
  run_step "03_stow.sh"
  run_step "04_claude.sh"
  run_step "05_tmux.sh"
  run_step "06_finish.sh"
  ;;
*)
  echo "❌ 알 수 없는 단계: $1"
  usage
  exit 1
  ;;
esac
