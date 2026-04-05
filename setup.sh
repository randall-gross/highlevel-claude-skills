#!/bin/bash
# HighLevel Claude Skills — Setup & License Management
# Commands: install (default), activate, deactivate, status, verify

set -euo pipefail

# ─── Config ───────────────────────────────────────────────────────────────────

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
SKILL_DIR="$CLAUDE_DIR/skills/highlevel"
LICENSE_FILE="$SKILL_DIR/.license"
API_URL="https://rdm-api.vercel.app/api/license"

# ─── Dependency Check ─────────────────────────────────────────────────────────

check_deps() {
  if ! command -v jq &> /dev/null; then
    echo "ERROR: jq is required but not installed."
    echo ""
    echo "Install it:"
    echo "  Mac:     brew install jq"
    echo "  Ubuntu:  sudo apt install jq"
    echo "  Windows: choco install jq  (or scoop install jq)"
    exit 1
  fi
  if ! command -v curl &> /dev/null; then
    echo "ERROR: curl is required but not installed."
    exit 1
  fi
}

# ─── Machine Fingerprint ─────────────────────────────────────────────────────

get_machine_hash() {
  local hostname_val user_val os_val raw

  hostname_val=$(hostname)
  user_val=$(whoami)

  case "$(uname -s)" in
    Linux*)              os_val="Linux" ;;
    Darwin*)             os_val="macOS" ;;
    MINGW*|MSYS*|CYGWIN*) os_val="Windows" ;;
    *)                   os_val="Unknown" ;;
  esac

  raw="${hostname_val}-${user_val}-${os_val}"

  if command -v sha256sum &> /dev/null; then
    echo -n "$raw" | sha256sum | cut -d' ' -f1
  elif command -v shasum &> /dev/null; then
    echo -n "$raw" | shasum -a 256 | cut -d' ' -f1
  else
    echo "ERROR: No SHA-256 tool found. Install coreutils." >&2
    exit 1
  fi
}

# ─── Install (default) ───────────────────────────────────────────────────────

cmd_install() {
  echo "=== HighLevel Claude Skills Setup ==="

  echo "Copying skill files..."
  mkdir -p "$SKILL_DIR"

  if [ -d "$SCRIPT_DIR/skills/highlevel" ]; then
    cp -r "$SCRIPT_DIR/skills/highlevel/"* "$SKILL_DIR/"
    echo "  done: skill files copied to $SKILL_DIR"
  else
    echo "  ERROR: skills/highlevel/ not found in $SCRIPT_DIR"
    exit 1
  fi

  # Copy hooks if they exist
  if [ -d "$SCRIPT_DIR/environment/hooks" ]; then
    echo "Copying hooks..."
    mkdir -p "$CLAUDE_DIR/hooks"
    for hook in "$SCRIPT_DIR/environment/hooks/"*.sh; do
      [ -f "$hook" ] || continue
      filename=$(basename "$hook")
      cp "$hook" "$CLAUDE_DIR/hooks/$filename"
      chmod +x "$CLAUDE_DIR/hooks/$filename"
      echo "  done: $filename"
    done
  fi

  echo ""
  echo "=== Setup Complete ==="
  echo ""
  echo "If you purchased Pro or Enterprise, run:"
  echo "  ./setup.sh activate"
}

# ─── Activate ─────────────────────────────────────────────────────────────────

cmd_activate() {
  check_deps

  echo "=== License Activation ==="
  echo ""

  read -rp "Enter your purchase email: " EMAIL
  if [ -z "$EMAIL" ]; then
    echo "ERROR: Email is required."
    exit 1
  fi

  read -rp "Enter your license ID (from your welcome email): " LICENSE_ID
  if [ -z "$LICENSE_ID" ]; then
    echo "ERROR: License ID is required."
    exit 1
  fi

  echo ""
  echo "Generating machine fingerprint..."
  MACHINE_HASH=$(get_machine_hash)
  echo "  Machine hash: ${MACHINE_HASH:0:12}..."

  echo "Contacting license server..."
  BODY=$(jq -n \
    --arg email "$EMAIL" \
    --arg licenseId "$LICENSE_ID" \
    --arg machineHash "$MACHINE_HASH" \
    '{email: $email, licenseId: $licenseId, machineHash: $machineHash}')

  HTTP_CODE=$(curl -s -o /tmp/hla-activate-response.json -w "%{http_code}" \
    -X POST "$API_URL/activate" \
    -H "Content-Type: application/json" \
    -d "$BODY")

  RESPONSE=$(cat /tmp/hla-activate-response.json)

  if [ "$HTTP_CODE" = "200" ]; then
    LICENSE_JSON=$(echo "$RESPONSE" | jq -r '.license')
    REMAINING=$(echo "$RESPONSE" | jq -r '.machinesRemaining')

    mkdir -p "$SKILL_DIR"
    echo "$LICENSE_JSON" | jq '.' > "$LICENSE_FILE"

    TIER=$(echo "$LICENSE_JSON" | jq -r '.tier')
    echo ""
    echo "=== License Activated ==="
    echo "  Tier: $TIER"
    echo "  Activations remaining: $REMAINING of 3"
    echo ""
    echo "Claude Code now has access to all $TIER domains."
  else
    ERROR=$(echo "$RESPONSE" | jq -r '.error // "Unknown error"')
    echo ""
    echo "ERROR: $ERROR"
    echo "HTTP status: $HTTP_CODE"
    exit 1
  fi

  rm -f /tmp/hla-activate-response.json
}

# ─── Deactivate ───────────────────────────────────────────────────────────────

cmd_deactivate() {
  check_deps

  if [ ! -f "$LICENSE_FILE" ]; then
    echo "ERROR: No license file found at $LICENSE_FILE"
    echo "Nothing to deactivate."
    exit 1
  fi

  echo "=== License Deactivation ==="
  echo ""

  # Read the full license file to send for signature verification
  LICENSE_JSON=$(cat "$LICENSE_FILE")

  HTTP_CODE=$(curl -s -o /tmp/hla-deactivate-response.json -w "%{http_code}" \
    -X POST "$API_URL/deactivate" \
    -H "Content-Type: application/json" \
    -d "$LICENSE_JSON")

  RESPONSE=$(cat /tmp/hla-deactivate-response.json)

  if [ "$HTTP_CODE" = "200" ]; then
    REMAINING=$(echo "$RESPONSE" | jq -r '.machinesRemaining')
    rm -f "$LICENSE_FILE"
    echo "Machine deactivated."
    echo "  Slots available: $REMAINING of 3"
    echo ""
    echo "License file removed. This machine no longer has paid access."
  else
    ERROR=$(echo "$RESPONSE" | jq -r '.error // "Unknown error"')
    echo "ERROR: $ERROR"
    exit 1
  fi

  rm -f /tmp/hla-deactivate-response.json
}

# ─── Status ───────────────────────────────────────────────────────────────────

cmd_status() {
  check_deps

  if [ ! -f "$LICENSE_FILE" ]; then
    echo "=== License Status ==="
    echo "  No license installed."
    echo "  Run ./setup.sh activate to activate a license."
    exit 0
  fi

  LICENSE_JSON=$(cat "$LICENSE_FILE")
  TIER=$(echo "$LICENSE_JSON" | jq -r '.tier')
  EMAIL=$(echo "$LICENSE_JSON" | jq -r '.email')
  LICENSE_ID=$(echo "$LICENSE_JSON" | jq -r '.licenseId')
  EXPIRES=$(echo "$LICENSE_JSON" | jq -r '.expiresAt')
  MACHINE=$(echo "$LICENSE_JSON" | jq -r '.machineHash')

  echo "=== License Status ==="
  echo "  Email:      $EMAIL"
  echo "  License ID: $LICENSE_ID"
  echo "  Tier:       $TIER"
  echo "  Expires:    $EXPIRES"
  echo "  Machine:    ${MACHINE:0:12}..."
  echo ""

  # Check with server
  echo "Checking with license server..."
  HTTP_CODE=$(curl -s -o /tmp/hla-check-response.json -w "%{http_code}" \
    -X GET "$API_URL/check?licenseId=$LICENSE_ID&machineHash=$MACHINE")

  RESPONSE=$(cat /tmp/hla-check-response.json)

  if [ "$HTTP_CODE" = "200" ]; then
    VALID=$(echo "$RESPONSE" | jq -r '.valid')
    if [ "$VALID" = "true" ]; then
      MACHINE_COUNT=$(echo "$RESPONSE" | jq -r '.machineCount')
      echo "  Server says: VALID"
      echo "  Machines registered: $MACHINE_COUNT of 3"
    else
      REASON=$(echo "$RESPONSE" | jq -r '.reason')
      echo "  Server says: INVALID — $REASON"
    fi
  else
    echo "  Could not reach license server (HTTP $HTTP_CODE)"
  fi

  rm -f /tmp/hla-check-response.json
}

# ─── Verify (refresh expiry) ─────────────────────────────────────────────────

cmd_verify() {
  check_deps

  if [ ! -f "$LICENSE_FILE" ]; then
    echo "ERROR: No license file found. Run ./setup.sh activate first."
    exit 1
  fi

  echo "=== License Verification ==="
  echo ""

  LICENSE_JSON=$(cat "$LICENSE_FILE")

  HTTP_CODE=$(curl -s -o /tmp/hla-verify-response.json -w "%{http_code}" \
    -X POST "$API_URL/verify" \
    -H "Content-Type: application/json" \
    -d "$LICENSE_JSON")

  RESPONSE=$(cat /tmp/hla-verify-response.json)

  if [ "$HTTP_CODE" = "200" ]; then
    VALID=$(echo "$RESPONSE" | jq -r '.valid')

    if [ "$VALID" = "true" ]; then
      NEW_LICENSE=$(echo "$RESPONSE" | jq -r '.license')
      echo "$NEW_LICENSE" | jq '.' > "$LICENSE_FILE"
      NEW_EXPIRES=$(echo "$NEW_LICENSE" | jq -r '.expiresAt')
      echo "License verified and refreshed."
      echo "  New expiry: $NEW_EXPIRES"
    else
      REASON=$(echo "$RESPONSE" | jq -r '.reason')
      echo "License is no longer valid: $REASON"

      if [ "$REASON" = "revoked" ]; then
        rm -f "$LICENSE_FILE"
        echo "License file removed."
      fi
    fi
  else
    echo "ERROR: Could not verify license (HTTP $HTTP_CODE)"
  fi

  rm -f /tmp/hla-verify-response.json
}

# ─── Main ─────────────────────────────────────────────────────────────────────

COMMAND="${1:-install}"

case "$COMMAND" in
  install)    cmd_install ;;
  activate)   cmd_activate ;;
  deactivate) cmd_deactivate ;;
  status)     cmd_status ;;
  verify)     cmd_verify ;;
  *)
    echo "Usage: ./setup.sh [command]"
    echo ""
    echo "Commands:"
    echo "  install      Copy skill files into ~/.claude/skills/ (default)"
    echo "  activate     Activate a paid license"
    echo "  deactivate   Release this machine's license slot"
    echo "  status       Check license status"
    echo "  verify       Re-validate license and refresh expiry"
    exit 1
    ;;
esac
