#!/bin/bash
# 04_claude.sh - Claude Code 설치

set -e

echo "🤖 [4/5] Claude Code 설치 시작..."

# 스크립트 프로세스에서 검증용으로만 사용 (영구 PATH는 .zshrc에서 관리)
export PATH="$HOME/.claude/bin:$HOME/.local/bin:$PATH"

if command -v claude &>/dev/null; then
  echo "  → Claude Code 이미 설치됨: $(claude --version)"
else
  echo "  → Claude Code 설치 중 (native installer)..."
  curl -fsSL https://claude.ai/install.sh | bash

  if command -v claude &>/dev/null; then
    echo "  → Claude Code 설치 완료: $(claude --version)"
  else
    echo "  ⚠️  claude 명령어를 찾을 수 없음. 셸 재시작 후 확인하세요."
  fi
fi

echo "✅ Claude Code 설치 완료"
