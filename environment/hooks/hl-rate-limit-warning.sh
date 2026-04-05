#!/bin/bash
# PreToolUse hook — warns about bulk HL API operations
# Matcher: Bash
#
# Detects patterns that suggest multiple sequential API calls to HighLevel
# (loops, xargs, batch scripts) and warns about the 100 req/10s rate limit.

COMMAND="$TOOL_INPUT"

# Only check commands targeting HL API
if ! echo "$COMMAND" | grep -qi "leadconnectorhq.com"; then
  exit 0
fi

# Patterns that suggest bulk/loop operations
BULK_PATTERNS=(
  "for .* in"
  "while .* do"
  "xargs"
  "parallel"
  ".forEach"
  ".map("
  "for (let\|for (const\|for (var"
)

for pattern in "${BULK_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qi "$pattern"; then
    echo "WARNING: This looks like a bulk operation against the HighLevel API."
    echo "Rate limit: 100 requests per 10 seconds per location."
    echo "Add a delay between calls (e.g., sleep 0.1) to avoid hitting rate limits."
    echo "Consider using bulk endpoints where available (e.g., /contacts/bulk/tags/update)."
    exit 0
  fi
done

exit 0
