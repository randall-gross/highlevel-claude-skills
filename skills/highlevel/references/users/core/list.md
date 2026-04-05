# List Users

- **Method:** GET
- **Path:** `/users/`
- **Scopes:** `users.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `role` | string | No | Filter by role (e.g., `admin`, `user`) |
| `limit` | integer | No | Number of results per page (default 25, max 100) |
| `offset` | integer | No | Number of results to skip for pagination |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/users/?locationId=ve9EPM428h8vShlRW1KT&limit=25' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "users": [
    {
      "id": "usr_abc123def456",
      "name": "Randall Gross",
      "firstName": "Randall",
      "lastName": "Gross",
      "email": "randall@rocketdigitalmarketing.io",
      "phone": "+14155551234",
      "type": "account",
      "role": "admin",
      "locationIds": ["ve9EPM428h8vShlRW1KT"],
      "permissions": {
        "contactsEnabled": true,
        "opportunitiesEnabled": true,
        "dashboardStatsEnabled": true
      }
    }
  ],
  "count": 1
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId parameter |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Populate a team member dropdown for assigning contacts or opportunities. Build an admin panel showing all users in a location.

## Gotchas
The `role` filter is case-sensitive. Agency-level users with `type: "account"` appear in all locations they have access to.
