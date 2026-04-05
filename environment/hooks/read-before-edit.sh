#!/bin/bash
# =============================================================================
# Hook: read-before-edit.sh
# Purpose: Reminds the user (or agent) to read a file before editing it.
#          This prevents blind edits that could break existing code.
# Trigger: PreToolUse
# Matcher: Edit
# Exit 0 = allow (this is a reminder, not a blocker)
# =============================================================================

# Extract file_path from TOOL_INPUT
FILE_PATH=$(echo "$TOOL_INPUT" | grep -oE '"file_path"\s*:\s*"[^"]*"' | head -1 | sed 's/.*"file_path"\s*:\s*"//;s/"$//')

if [ -n "$FILE_PATH" ]; then
  echo "REMINDER: Make sure you have read '$FILE_PATH' before editing it."
else
  echo "REMINDER: Make sure you have read this file before editing it."
fi

# Always allow — this is just a warning
exit 0
