# Exchange Token

- **Method:** POST
- **Path:** `/oauth/token`
- **Scopes:** `oauth.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `client_id` | string | Yes | Your app's client ID |
| `client_secret` | string | Yes | Your app's client secret |
| `grant_type` | string | Yes | `authorization_code` (initial) or `refresh_token` (renewal) |
| `code` | string | Conditional | Authorization code from callback (required for `authorization_code` grant) |
| `redirect_uri` | string | Conditional | Must match the redirect URI registered with your app (required for `authorization_code` grant) |
| `refresh_token` | string | Conditional | Refresh token from a previous exchange (required for `refresh_token` grant) |
| `user_type` | string | No | `Company` (agency) or `Location` (sub-account). Defaults to `Location` |

## Request Example

### Initial Token Exchange
```bash
curl -X POST \
  'https://services.leadconnectorhq.com/oauth/token' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'client_id=your-client-id&client_secret=YOUR_SECRET&grant_type=authorization_code&code=AUTH_CODE_FROM_CALLBACK&redirect_uri=https://your-domain.com/oauth/callback&user_type=Location'
```

### Refresh Token
```bash
curl -X POST \
  'https://services.leadconnectorhq.com/oauth/token' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'client_id=your-client-id&client_secret=YOUR_SECRET&grant_type=refresh_token&refresh_token=STORED_REFRESH_TOKEN&user_type=Location'
```

## Response Example

```json
{
  "access_token": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "Bearer",
  "expires_in": 86400,
  "refresh_token": "rt_abc123def456ghi789",
  "scope": "contacts.readonly contacts.write opportunities.readonly",
  "locationId": "ve9EPM428h8vShlRW1KT",
  "companyId": "comp_abc123",
  "userId": "usr_abc123def456",
  "userType": "Location"
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid grant_type or missing required fields |
| 401 | Unauthorized — invalid client_id or client_secret |
| 403 | Forbidden — authorization code expired or already used |

## Common Use Cases
Complete the OAuth 2.0 flow after a user installs your marketplace app. Refresh an expiring access token in a background cron job.

## Gotchas
This endpoint uses `application/x-www-form-urlencoded`, NOT JSON. Authorization codes are single-use and expire in 10 minutes. The `refresh_token` changes on every refresh — always store the new one. If you lose the refresh token, the user must reinstall the app.
