# Search Users

- **Method:** GET
- **Path:** `/users/search`
- **Scopes:** `users.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `query` | string | No | Search string (matches name, email, phone) |
| `limit` | integer | No | Number of results (default 25, max 100) |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/users/search?locationId=ve9EPM428h8vShlRW1KT&query=randall' \
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
      "role": "admin"
    }
  ],
  "count": 1
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Typeahead search when assigning a user to a contact or opportunity. Find a user by email to check if they already exist.

## Gotchas
The `query` parameter is a fuzzy match across name, email, and phone. It does not support field-specific filtering — use `filter-by-email` for exact email matching.
