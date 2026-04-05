# Update User

- **Method:** PUT
- **Path:** `/users/{userId}`
- **Scopes:** `users.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `userId` | string | Yes | The user ID to update |

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `firstName` | string | No | User's first name |
| `lastName` | string | No | User's last name |
| `phone` | string | No | Phone number in E.164 format |
| `role` | string | No | Role: `admin`, `user`, or custom role ID |
| `locationIds` | string[] | No | Array of location IDs the user can access |
| `permissions` | object | No | Granular permissions object |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/users/usr_abc123def456' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "firstName": "Randall",
    "lastName": "Gross",
    "role": "admin",
    "permissions": {
      "contactsEnabled": true,
      "opportunitiesEnabled": true,
      "dashboardStatsEnabled": true,
      "campaignsEnabled": true
    }
  }'
```

## Response Example

```json
{
  "id": "usr_abc123def456",
  "firstName": "Randall",
  "lastName": "Gross",
  "email": "randall@rocketdigitalmarketing.io",
  "role": "admin",
  "permissions": {
    "contactsEnabled": true,
    "opportunitiesEnabled": true,
    "dashboardStatsEnabled": true,
    "campaignsEnabled": true
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid field values |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — user ID does not exist |
| 422 | Unprocessable Entity — invalid role or locationId |

## Common Use Cases
Update a user's permissions when their role changes. Add a user to additional locations.

## Gotchas
You cannot change a user's email via this endpoint. The `locationIds` field replaces the entire array — include all locations, not just the new ones.
