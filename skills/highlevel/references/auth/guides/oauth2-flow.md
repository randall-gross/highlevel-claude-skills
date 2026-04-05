# OAuth 2.0 Flow for Marketplace Apps

> **This is a guide, not an API endpoint.**

The full OAuth 2.0 authorization code flow for HighLevel marketplace apps. This is how third-party apps (including the Rocket Digital Client Connector) authenticate with client locations.

## Rocket Digital Client Connector

| Property | Value |
|----------|-------|
| App ID | `69a4dc27c86f2926349dac9d` |
| Client ID | `69a4dc27c86f2926349dac9d-mm8gqa32` |
| Callback URL | `https://api.rocketdigitalmarketing.io/oauth/callback` |

## The Flow

### Step 1: Authorization URL

Redirect the user to HighLevel's authorization page:

```
https://marketplace.gohighlevel.com/oauth/chooselocation?response_type=code&redirect_uri=https://api.rocketdigitalmarketing.io/oauth/callback&client_id=69a4dc27c86f2926349dac9d-mm8gqa32&scope=contacts.readonly contacts.write calendars.readonly opportunities.readonly opportunities.write
```

**Parameters:**
| Name | Description |
|------|-------------|
| `response_type` | Always `code` |
| `redirect_uri` | Must match your registered callback exactly |
| `client_id` | Your app's client ID |
| `scope` | Space-separated list of requested scopes |

### Step 2: User Authorizes

The user selects which location(s) to install the app in and clicks "Authorize". HighLevel redirects to your callback URL with a `code` parameter:

```
https://api.rocketdigitalmarketing.io/oauth/callback?code=AUTH_CODE_HERE
```

### Step 3: Exchange Code for Tokens

```typescript
// In your callback route handler
const response = await fetch('https://services.leadconnectorhq.com/oauth/token', {
  method: 'POST',
  headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
  body: new URLSearchParams({
    client_id: '69a4dc27c86f2926349dac9d-mm8gqa32',
    client_secret: process.env.GHL_CLIENT_SECRET!,
    grant_type: 'authorization_code',
    code: authCode,
    redirect_uri: 'https://api.rocketdigitalmarketing.io/oauth/callback',
    user_type: 'Location',
  }),
});

const tokens = await response.json();
// tokens.access_token — use for API calls (24h expiry)
// tokens.refresh_token — store securely for renewal
// tokens.locationId — the installed location
```

### Step 4: Store Tokens

Store in your database, keyed by `locationId`:

```typescript
await db.oauthTokens.upsert({
  locationId: tokens.locationId,
  accessToken: tokens.access_token,
  refreshToken: tokens.refresh_token,
  expiresAt: new Date(Date.now() + tokens.expires_in * 1000),
  scopes: tokens.scope,
});
```

### Step 5: Refresh Cycle

Access tokens expire after 24 hours. Implement proactive refresh:

```typescript
async function getValidToken(locationId: string) {
  const stored = await db.oauthTokens.findByLocationId(locationId);

  // Refresh if expiring within 1 hour
  if (stored.expiresAt < new Date(Date.now() + 60 * 60 * 1000)) {
    const response = await fetch('https://services.leadconnectorhq.com/oauth/token', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: new URLSearchParams({
        client_id: '69a4dc27c86f2926349dac9d-mm8gqa32',
        client_secret: process.env.GHL_CLIENT_SECRET!,
        grant_type: 'refresh_token',
        refresh_token: stored.refreshToken,
        user_type: 'Location',
      }),
    });

    const newTokens = await response.json();

    // IMPORTANT: Store the NEW refresh token — it changes every time
    await db.oauthTokens.update(locationId, {
      accessToken: newTokens.access_token,
      refreshToken: newTokens.refresh_token,
      expiresAt: new Date(Date.now() + newTokens.expires_in * 1000),
    });

    return newTokens.access_token;
  }

  return stored.accessToken;
}
```

### Step 6: Location Token Conversion (Agency Apps)

If your app is installed at the agency level (`user_type: 'Company'`), convert to location-scoped tokens for sub-account API calls:

```typescript
const locationToken = await fetch('https://services.leadconnectorhq.com/oauth/locationToken', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${agencyAccessToken}`,
    'Content-Type': 'application/json',
    'Version': '2021-07-28',
  },
  body: JSON.stringify({
    companyId: 'comp_abc123',
    locationId: 've9EPM428h8vShlRW1KT',
  }),
});
```

## Key Gotchas

1. **Token endpoint uses form-urlencoded, not JSON.** This is the #1 source of integration bugs.
2. **Refresh tokens are single-use.** Each refresh returns a new refresh token. If you lose it, the user must reinstall.
3. **Authorization codes expire in 10 minutes** and are single-use.
4. **Scopes are fixed at install time.** To add scopes, the user must uninstall and reinstall.
5. **Rate limits apply per location**, not per token. Multiple tokens for the same location share the same rate limit.

## Related

- `../oauth/token.md` — Token exchange endpoint reference
- `../oauth/location-token.md` — Location token endpoint reference
- `../oauth/installed-locations.md` — List installed locations
- `private-token.md` — Simpler auth for single-location use
