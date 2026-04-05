#!/bin/bash
# PreToolUse hook — warns when HL API calls may be missing locationId
# Matcher: Bash
#
# Most HighLevel API endpoints require locationId as a query parameter
# or in the request body. Without it, calls fail silently or return
# empty results. This hook checks for its presence.

COMMAND="$TOOL_INPUT"

# Only check commands targeting HL API
if ! echo "$COMMAND" | grep -qi "leadconnectorhq.com"; then
  exit 0
fi

# Endpoints that DON'T need locationId (agency-level or have it in path)
# - /oauth/ endpoints
# - /snapshots/
# - /saas/ endpoints
# - /companies/
# - /locations/ (locationId IS the resource)
# - /social-media-posting/{locationId}/ (locationId in path)
# - /funnels/ (uses locationId in query but often optional)
if echo "$COMMAND" | grep -qiE "/oauth/|/snapshots/|/saas/|/companies/|/locations/|/social-media-posting/[a-zA-Z0-9]"; then
  exit 0
fi

# Check if locationId is present anywhere in the command
if ! echo "$COMMAND" | grep -qi "locationId\|location_id\|locationid"; then
  echo "WARNING: This HighLevel API call may be missing 'locationId'."
  echo "Most HL endpoints require locationId as a query parameter or in the request body."
  echo "Without it, the call may fail silently or return empty results."
fi

exit 0
