#!/usr/bin/env bash
# Installs the skills in ./skills into Claude Code's personal skills folder.
# Usage:  ./install.sh            (installs into ~/.claude/skills)
#         CLAUDE_SKILLS_DIR=/path ./install.sh
# Existing skills with the same name are backed up, never silently overwritten.
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
STAMP="$(date +%Y%m%d-%H%M%S)"

[ -d "$SRC" ] || { echo "No encuentro la carpeta skills/ junto a este script." >&2; exit 1; }
mkdir -p "$DEST"

installed=0
for dir in "$SRC"/*/; do
  name="$(basename "$dir")"
  [ -f "$dir/SKILL.md" ] || continue
  if [ -e "$DEST/$name" ]; then
    mv "$DEST/$name" "$DEST/$name.bak-$STAMP"
    echo "  respaldo: $name -> $name.bak-$STAMP"
  fi
  cp -R "$dir" "$DEST/$name"
  echo "  ok: $name"
  installed=$((installed + 1))
done

echo
echo "$installed skills instaladas en $DEST"
echo "Abre una sesión nueva de Claude Code para que las cargue."
