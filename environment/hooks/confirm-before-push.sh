#!/bin/bash
# =============================================================================
# Hook: confirm-before-push.sh
# Purpose: Prevents force pushes and pushes directly to main/master branches.
#          Protects shared branches from accidental overwrites.
# Trigger: PreToolUse
# Matcher: Bash
# Exit 0 = allow, Exit 2 = block
# =============================================================================

COMMAND="$TOOL_INPUT"

# Only check commands that contain "git push"
if ! echo "$COMMAND" | grep -qi "git push"; then
  exit 0
fi

# Block force pushes (--force or -f flag)
if echo "$COMMAND" | grep -qiE "git push\s+.*(-f|--force)"; then
  echo "BLOCKED: Force pushing is not allowed. It rewrites remote history and can destroy teammates' work. Ask Randall before force pushing."
  exit 2
fi

# Block pushes to main or master
if echo "$COMMAND" | grep -qiE "git push\s+\S+\s+(main|master)(\s|$)"; then
  echo "BLOCKED: Pushing directly to main/master is not allowed. Create a feature branch and open a PR instead."
  exit 2
fi

# Also catch "git push origin main" style with no remote specified (defaults to main/master)
if echo "$COMMAND" | grep -qiE "git push\s+(main|master)(\s|$)"; then
  echo "BLOCKED: Pushing directly to main/master is not allowed. Create a feature branch and open a PR instead."
  exit 2
fi

# Other pushes are fine
exit 0
