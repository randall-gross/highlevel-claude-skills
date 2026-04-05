#!/bin/bash
# =============================================================================
# Hook: hl-api-version-check.sh
# Purpose: Checks that HighLevel API calls include the correct API version
#          header (Version: 2021-07-28). Missing this header causes silent
#          failures or unexpected responses from the HL API.
# Trigger: PreToolUse
# Matcher: Bash
# Exit 0 = allow (this is a warning, not a blocker)
# =============================================================================

COMMAND="$TOOL_INPUT"

# Only check commands that call the HighLevel API
if ! echo "$COMMAND" | grep -qi "leadconnectorhq.com"; then
  exit 0
fi

# Warn if the Version header is missing
if ! echo "$COMMAND" | grep -qE "Version.*2021-07-28"; then
  echo "WARNING: This HighLevel API call may be missing the required 'Version: 2021-07-28' header. HL API requests without this header can fail silently or return unexpected results."
fi

# Always allow — this is just a warning
exit 0
