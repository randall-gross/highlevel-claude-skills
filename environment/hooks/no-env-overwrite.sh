#!/bin/bash
# =============================================================================
# Hook: no-env-overwrite.sh
# Purpose: Prevents writing to .env files, which contain secrets and
#          environment-specific configuration managed by Randall.
# Trigger: PreToolUse
# Matcher: Edit|Write
# Exit 0 = allow, Exit 2 = block
# =============================================================================

# Extract file_path from TOOL_INPUT
FILE_PATH=$(echo "$TOOL_INPUT" | grep -oE '"file_path"\s*:\s*"[^"]*"' | head -1 | sed 's/.*"file_path"\s*:\s*"//;s/"$//')

if [ -z "$FILE_PATH" ]; then
  # No file path found — allow
  exit 0
fi

# Get just the filename from the path
FILENAME=$(basename "$FILE_PATH")

# Block exact matches for known env files
case "$FILENAME" in
  .env|.env.local|.env.production|.env.staging|.env.development)
    echo "BLOCKED: Environment files are managed by Randall. Ask before making changes."
    exit 2
    ;;
esac

# Block .env.*.local pattern (e.g., .env.production.local, .env.staging.local)
if echo "$FILENAME" | grep -qE '^\.env\..+\.local$'; then
  echo "BLOCKED: Environment files are managed by Randall. Ask before making changes."
  exit 2
fi

# Not an env file — allow
exit 0
