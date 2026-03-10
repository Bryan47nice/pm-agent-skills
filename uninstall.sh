#!/bin/bash

# ============================================================
# PM Agent Skills — Uninstaller for Claude Code
# ============================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m'

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GLOBAL_COMMANDS_DIR="$HOME/.claude/commands"
LOCAL_COMMANDS_DIR="$(pwd)/.claude/commands"
MODE="global"

for arg in "$@"; do
  case $arg in
    --local) MODE="local" ;;
  esac
done

TARGET_DIR="$GLOBAL_COMMANDS_DIR"
[ "$MODE" = "local" ] && TARGET_DIR="$LOCAL_COMMANDS_DIR"

echo ""
echo -e "${BOLD}PM Agent Skills — Uninstaller${NC}"
echo ""

if [ ! -d "$TARGET_DIR" ]; then
  echo -e "${YELLOW}Nothing to uninstall. Directory not found: $TARGET_DIR${NC}"
  exit 0
fi

removed=0
SKILL_FILES=()
while IFS= read -r -d '' file; do
  SKILL_FILES+=("$file")
done < <(find "$REPO_DIR/skills" -name "SKILL.md" -print0 | sort -z)

for skill_file in "${SKILL_FILES[@]}"; do
  skill_name=$(grep -m1 '^name:' "$skill_file" 2>/dev/null | sed 's/^name:[[:space:]]*//' | tr -d '\r' | tr -d ' ')
  if [ -z "$skill_name" ]; then
    skill_name=$(basename "$(dirname "$skill_file")")
  fi

  dest="$TARGET_DIR/${skill_name}.md"
  if [ -f "$dest" ]; then
    rm "$dest"
    echo -e "  ${RED}✗${NC} Removed /${skill_name}"
    ((removed++)) || true
  fi
done

echo ""
echo -e "${BOLD}Removed $removed skill(s) from:${NC} $TARGET_DIR"
echo ""
