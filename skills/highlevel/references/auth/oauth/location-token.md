# Get Location Token

- **Method:** POST
- **Path:** `/oauth/locationToken`
- **Scopes:** `oauth.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `companyId` | string | Yes | The agency company ID |
| `locationId` | string | Yes | The sub-account location ID to scope the token to |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/oauth/locationToken' \
  -H 'Authorization: Bearer AGENCY_ACCESS_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "companyId": "comp_abc123",
    "locationId": "ve9EPM428h8vShlRW1KT"
  }'
```

## Response Example

```json
{
  "access_token": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "Bearer",
  "expires_in": 86400,
  "scope": "contacts.readonly contacts.write opportunities.readonly",
  "locationId": "ve9EPM428h8vShlRW1KT"
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing companyId or locationId |
| 401 | Unauthorized — invalid or expired agency token |
| 403 | Forbidden — app not installed in the specified location |

## Common Use Cases
Convert an agency-level token into a location-scoped token for making sub-account API calls. Essential for multi-tenant SaaS apps that manage multiple client locations from a single agency install.

## Gotchas
The input token must be an agency-level (`Company` type) token. Location tokens expire after 24 hours and do NOT come with a refresh token — request a new one from the agency token each time. The agency token must still be valid when you request a location token.
