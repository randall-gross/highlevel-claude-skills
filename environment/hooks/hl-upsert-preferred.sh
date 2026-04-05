#!/bin/bash
# PreToolUse hook — suggests upsert over create for contacts
# Matcher: Bash
#
# Catches direct POST to /contacts/ (create endpoint) and recommends
# /contacts/upsert instead. Upsert deduplicates by email/phone and
# prevents creating duplicate contacts — the #1 mistake with lead forms.

COMMAND="$TOOL_INPUT"

# Only check commands targeting HL API
if ! echo "$COMMAND" | grep -qi "leadconnectorhq.com"; then
  exit 0
fi

# Detect POST to /contacts/ but NOT to sub-endpoints
if echo "$COMMAND" | grep -qiE "POST.*/contacts/?" ; then
  # Skip if it's a known sub-endpoint (upsert, search, bulk, etc.)
  if ! echo "$COMMAND" | grep -qiE "/contacts/(upsert|search|bulk|dnd|tags|notes|tasks|followers|campaigns|workflow)"; then
    echo "SUGGESTION: Consider using POST /contacts/upsert instead of POST /contacts/"
    echo "Upsert deduplicates by email/phone — if a contact already exists, it updates"
    echo "instead of creating a duplicate. This is the recommended approach for lead forms."
  fi
fi

exit 0
