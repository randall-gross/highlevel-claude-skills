#!/bin/bash
# Rocket Claude Kit — Setup Script
# Symlinks skills and copies hooks into ~/.claude/

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "=== Rocket Claude Kit Setup ==="

# 1. Symlink skills
echo "Linking skills..."
mkdir -p "$CLAUDE_DIR/skills"
if [ -L "$CLAUDE_DIR/skills/highlevel" ]; then
  rm "$CLAUDE_DIR/skills/highlevel"
fi
ln -sfn "$SCRIPT_DIR/skills/highlevel" "$CLAUDE_DIR/skills/highlevel"
echo "  done: highlevel skill linked"

# 2. Copy hooks
echo "Copying hooks..."
mkdir -p "$CLAUDE_DIR/hooks"
for hook in "$SCRIPT_DIR/environment/hooks/"*.sh; do
  filename=$(basename "$hook")
  cp "$hook" "$CLAUDE_DIR/hooks/$filename"
  chmod +x "$CLAUDE_DIR/hooks/$filename"
  echo "  done: $filename"
done

# 3. Settings reminder
echo ""
echo "=== Manual Step Required ==="
echo "Merge environment/settings-template.json into ~/.claude/settings.json"
echo "You can do this with jq:"
echo "  jq -s '.[0] * .[1]' ~/.claude/settings.json environment/settings-template.json > tmp.json && mv tmp.json ~/.claude/settings.json"
echo ""
echo "=== Setup Complete ==="
