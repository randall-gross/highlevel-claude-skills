#!/bin/bash
# =============================================================================
# Hook: block-secret-leak.sh
# Purpose: Scans file content being written or edited for hardcoded secrets,
#          API keys, tokens, and passwords. Prevents accidental secret leaks
#          into source files.
# Trigger: PreToolUse
# Matcher: Edit|Write
# Exit 0 = allow, Exit 2 = block
# =============================================================================

CONTENT="$TOOL_INPUT"

# Secret patterns to detect
SECRET_PATTERNS=(
  'sk-[a-zA-Z0-9]{20,}'
  'pk_live_'
  'pk_test_'
  'ghp_[a-zA-Z0-9]{36}'
  'gho_[a-zA-Z0-9]{36}'
  'PRIVATE_TOKEN\s*=\s*['"'"'""][^'"'"'"]{10,}'
  'SECRET_KEY\s*=\s*['"'"'""][^'"'"'"]{10,}'
  'password\s*[:=]\s*['"'"'""][^'"'"'"]{8,}'
  'Bearer [a-zA-Z0-9._-]{20,}'
)

for pattern in "${SECRET_PATTERNS[@]}"; do
  if echo "$CONTENT" | grep -qiE "$pattern"; then
    echo "BLOCKED: This content appears to contain a secret or API key (matched pattern: '$pattern'). Secrets should be stored in environment variables, not in source files."
    exit 2
  fi
done

# No secrets detected — allow
exit 0
