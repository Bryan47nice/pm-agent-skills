#!/bin/bash

# ============================================================
# PM Agent Skills — Installer for Claude Code
# ============================================================
# Usage:
#   ./install.sh           → install all skills globally
#   ./install.sh --local   → install to current project only
#   ./install.sh --list    → list all available skills
# ============================================================

set -e

# ── Colors ──────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# ── Config ───────────────────────────────────────────────────
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GLOBAL_COMMANDS_DIR="$HOME/.claude/commands"
LOCAL_COMMANDS_DIR="$(pwd)/.claude/commands"
MODE="global"

# ── Parse args ───────────────────────────────────────────────
for arg in "$@"; do
  case $arg in
    --local)  MODE="local" ;;
    --list)   MODE="list" ;;
    --help|-h)
      echo ""
      echo "  ${BOLD}PM Agent Skills Installer${NC}"
      echo ""
      echo "  Usage:"
      echo "    ./install.sh            Install all skills globally (~/.claude/commands/)"
      echo "    ./install.sh --local    Install to current project (.claude/commands/)"
      echo "    ./install.sh --list     List available skills without installing"
      echo "    ./install.sh --help     Show this help"
      echo ""
      exit 0
      ;;
  esac
done

# ── Header ───────────────────────────────────────────────────
echo ""
echo -e "${BOLD}${CYAN}╔══════════════════════════════════════════╗${NC}"
echo -e "${BOLD}${CYAN}║     PM Agent Skills × Claude Code        ║${NC}"
echo -e "${BOLD}${CYAN}╚══════════════════════════════════════════╝${NC}"
echo ""

# ── Find all SKILL.md files ──────────────────────────────────
SKILL_FILES=()
while IFS= read -r -d '' file; do
  SKILL_FILES+=("$file")
done < <(find "$REPO_DIR/skills" -name "SKILL.md" -print0 | sort -z)

if [ ${#SKILL_FILES[@]} -eq 0 ]; then
  echo -e "${RED}✗ No SKILL.md files found in: $REPO_DIR${NC}"
  exit 1
fi

# ── List mode ────────────────────────────────────────────────
if [ "$MODE" = "list" ]; then
  echo -e "${BOLD}Available Skills (${#SKILL_FILES[@]} found):${NC}"
  echo ""
  for skill_file in "${SKILL_FILES[@]}"; do
    # Extract name from frontmatter
    skill_name=$(grep -m1 '^name:' "$skill_file" 2>/dev/null | sed 's/^name:[[:space:]]*//' | tr -d '\r')
    if [ -z "$skill_name" ]; then
      skill_name=$(basename "$(dirname "$skill_file")")
    fi
    # Extract description (first line of description value)
    description=$(grep -m1 '^description:' "$skill_file" 2>/dev/null | sed 's/^description:[[:space:]]*//' | cut -c1-60 | tr -d '\r')
    echo -e "  ${GREEN}/${skill_name}${NC}"
    if [ -n "$description" ]; then
      echo -e "  ${YELLOW}↳ ${description}...${NC}"
    fi
    echo ""
  done
  exit 0
fi

# ── Set target dir ───────────────────────────────────────────
if [ "$MODE" = "local" ]; then
  TARGET_DIR="$LOCAL_COMMANDS_DIR"
  echo -e "${BLUE}Mode: Project-local (.claude/commands/)${NC}"
else
  TARGET_DIR="$GLOBAL_COMMANDS_DIR"
  echo -e "${BLUE}Mode: Global (~/.claude/commands/)${NC}"
fi
echo ""

# ── Create target dir ────────────────────────────────────────
mkdir -p "$TARGET_DIR"

# ── Strip frontmatter helper ─────────────────────────────────
strip_frontmatter() {
  local file="$1"
  local content
  content=$(cat "$file")

  # If file starts with ---, strip the frontmatter block
  if echo "$content" | head -1 | grep -q '^---'; then
    # Find the closing --- and print everything after it
    awk 'BEGIN{fm=1} fm && /^---/ && NR>1{fm=0; next} !fm{print}' "$file"
  else
    cat "$file"
  fi
}

# ── Install loop ─────────────────────────────────────────────
installed=0
skipped=0
updated=0

echo -e "${BOLD}Installing skills:${NC}"
echo ""

for skill_file in "${SKILL_FILES[@]}"; do
  # Extract skill name from frontmatter, fallback to directory name
  skill_name=$(grep -m1 '^name:' "$skill_file" 2>/dev/null | sed 's/^name:[[:space:]]*//' | tr -d '\r' | tr -d ' ')
  if [ -z "$skill_name" ]; then
    skill_name=$(basename "$(dirname "$skill_file")")
  fi

  dest="$TARGET_DIR/${skill_name}.md"

  # Strip frontmatter and write to destination
  stripped_content=$(strip_frontmatter "$skill_file")

  if [ -f "$dest" ]; then
    # Check if content is different
    existing_hash=$(md5sum "$dest" 2>/dev/null | cut -d' ' -f1 || md5 -q "$dest" 2>/dev/null)
    new_hash=$(echo "$stripped_content" | md5sum 2>/dev/null | cut -d' ' -f1 || echo "$stripped_content" | md5 2>/dev/null)
    if [ "$existing_hash" = "$new_hash" ]; then
      echo -e "  ${YELLOW}⊙${NC} /${skill_name} ${YELLOW}(unchanged)${NC}"
      ((skipped++)) || true
    else
      echo "$stripped_content" > "$dest"
      echo -e "  ${CYAN}↑${NC} /${skill_name} ${CYAN}(updated)${NC}"
      ((updated++)) || true
    fi
  else
    echo "$stripped_content" > "$dest"
    echo -e "  ${GREEN}✓${NC} /${skill_name} ${GREEN}(installed)${NC}"
    ((installed++)) || true
  fi
done

# ── Summary ──────────────────────────────────────────────────
echo ""
echo -e "${BOLD}────────────────────────────────────────────${NC}"
echo -e "  ${GREEN}✓ Installed:${NC}  $installed"
echo -e "  ${CYAN}↑ Updated:${NC}   $updated"
echo -e "  ${YELLOW}⊙ Unchanged:${NC} $skipped"
echo -e "${BOLD}────────────────────────────────────────────${NC}"
echo ""
echo -e "${BOLD}Target:${NC} $TARGET_DIR"
echo ""

# ── Usage hint ───────────────────────────────────────────────
echo -e "${BOLD}How to use in Claude Code:${NC}"
echo ""
for skill_file in "${SKILL_FILES[@]}"; do
  skill_name=$(grep -m1 '^name:' "$skill_file" 2>/dev/null | sed 's/^name:[[:space:]]*//' | tr -d '\r' | tr -d ' ')
  if [ -z "$skill_name" ]; then
    skill_name=$(basename "$(dirname "$skill_file")")
  fi
  echo -e "  Type ${GREEN}/${skill_name}${NC} to activate"
done

echo ""
echo -e "${BOLD}${GREEN}✓ Done! Restart Claude Code if it's already running.${NC}"
echo ""
