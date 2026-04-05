# Get User

- **Method:** GET
- **Path:** `/users/{userId}`
- **Scopes:** `users.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `userId` | string | Yes | The user ID |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/users/usr_abc123def456' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
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
  },
  "dateAdded": "2024-01-10T09:00:00.000Z"
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — user ID does not exist |

## Common Use Cases
Fetch a specific user's profile and permissions for display in a settings panel.

## Gotchas
Returns the full permissions object, which can be large. The user must belong to a location accessible by your token.
