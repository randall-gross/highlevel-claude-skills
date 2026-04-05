# List Installed Locations

- **Method:** GET
- **Path:** `/oauth/installedLocations`
- **Scopes:** `oauth.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `appId` | string | Yes | Your marketplace app ID |
| `companyId` | string | Yes | The agency company ID |
| `limit` | integer | No | Results per page (default 20, max 100) |
| `offset` | integer | No | Number of results to skip |
| `isInstalled` | boolean | No | Filter by install status (`true` or `false`) |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/oauth/installedLocations?appId=your-app-id&companyId=comp_abc123&isInstalled=true&limit=50' \
  -H 'Authorization: Bearer AGENCY_ACCESS_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "locations": [
    {
      "locationId": "ve9EPM428h8vShlRW1KT",
      "name": "Example Business A",
      "isInstalled": true,
      "installedAt": "2024-06-15T14:30:00.000Z"
    },
    {
      "locationId": "pQr3sTuVwXyZ1234abcd",
      "name": "Example Business B",
      "isInstalled": true,
      "installedAt": "2024-07-01T09:00:00.000Z"
    }
  ],
  "total": 2,
  "limit": 50,
  "offset": 0
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing appId or companyId |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Build an admin dashboard showing which client locations have your app installed. Check installation status before attempting to generate a location token.

## Gotchas
Requires an agency-level token. The `isInstalled` filter defaults to showing all locations (both installed and uninstalled). Pagination uses offset-based, not cursor-based.
