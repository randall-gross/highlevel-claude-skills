# Private Integration Tokens

> **This is a guide, not an API endpoint.**

Private Integration Tokens are the simplest way to authenticate with the HighLevel API V2. They are ideal for internal tools, automations, and single-location integrations where you control the environment.

## What Is a Private Token?

A Private Integration Token is a long-lived API key scoped to a single HighLevel sub-account (location). Unlike OAuth tokens, they don't require a callback flow — you generate them directly in the HL dashboard.

## How to Create One

1. Log in to HighLevel
2. Navigate to **Settings > Integrations > Private Integrations**
3. Click **Create Private Integration**
4. Name it descriptively (e.g., "Rocket Website API", "Claude MCP Server")
5. Select the **scopes** your integration needs (contacts.readonly, contacts.write, etc.)
6. Click **Create** and copy the token immediately — it won't be shown again

## Token Properties

| Property | Value |
|----------|-------|
| Format | Long JWT string |
| Scope | Single location (sub-account) |
| Expiry | 90 days from creation |
| Refresh | Not refreshable — create a new one before expiry |
| Revocation | Settings > Integrations > delete the integration |

## Usage Pattern

```typescript
// .env.local
GHL_PRIVATE_TOKEN=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...
GHL_LOCATION_ID=ve9EPM428h8vShlRW1KT

// api-client.ts
const headers = {
  'Authorization': `Bearer ${process.env.GHL_PRIVATE_TOKEN}`,
  'Content-Type': 'application/json',
  'Version': '2021-07-28',
};

const response = await fetch(
  `https://services.leadconnectorhq.com/contacts/?locationId=${process.env.GHL_LOCATION_ID}`,
  { headers }
);
```

## Scoping Best Practices

- **Principle of least privilege:** Only enable scopes your integration actually uses.
- **Common scopes for client websites:** `contacts.readonly`, `contacts.write`, `calendars.readonly`, `calendars/events.readonly`, `opportunities.readonly`, `opportunities.write`
- **Common scopes for MCP servers:** Add `conversations.readonly`, `conversations.write`, `conversations/message.readonly`, `conversations/message.write`

## Rotation Strategy

Private tokens expire every 90 days. Build a reminder:

1. Store the creation date alongside the token
2. Set a calendar reminder for day 80
3. Generate a new token before the old one expires
4. Update your `.env.local` or secrets manager
5. Delete the old integration from the HL dashboard

## When NOT to Use Private Tokens

- **Marketplace apps** — Use OAuth 2.0 instead (see `oauth2-flow.md`)
- **Multi-location access** — Private tokens are single-location; use agency OAuth for multi-tenant
- **Client-side code** — Never expose private tokens in browser JavaScript

## Related

- `../oauth/token.md` — OAuth token exchange
- `oauth2-flow.md` — Full OAuth 2.0 guide for marketplace apps
