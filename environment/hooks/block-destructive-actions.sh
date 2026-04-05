#!/bin/bash
# =============================================================================
# Hook: block-destructive-actions.sh
# Purpose: Prevents destructive commands from being executed by non-developer
#          team members. Catches dangerous file deletions, git resets, SQL
#          drops, and process kills.
# Trigger: PreToolUse
# Matcher: Bash
# Exit 0 = allow, Exit 2 = block
# =============================================================================

COMMAND="$TOOL_INPUT"

# List of destructive patterns to block (checked case-insensitively)
PATTERNS=(
  "rm -rf"
  "rm -fr"
  "rmdir /s"
  "git reset --hard"
  "git checkout \."
  "git checkout -- \."
  "git restore \."
  "git clean -f"
  "git clean -fd"
  "DROP TABLE"
  "DROP DATABASE"
  "DELETE FROM"
  "TRUNCATE TABLE"
  "taskkill /F"
  "taskkill /f"
  "kill -9"
)

for pattern in "${PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qi "$pattern"; then
    echo "BLOCKED: This is a destructive command ('$pattern'). Ask Randall before running it."
    exit 2
  fi
done

# No destructive pattern matched — allow
exit 0
