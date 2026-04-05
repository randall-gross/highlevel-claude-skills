# Filter Users by Email

- **Method:** POST
- **Path:** `/users/search/filter-by-email`
- **Scopes:** `users.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `emails` | string[] | Yes | Array of email addresses to search for |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/users/search/filter-by-email' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "emails": [
      "randall@rocketdigitalmarketing.io",
      "eric@rocketdigitalmarketing.io"
    ]
  }'
```

## Response Example

```json
{
  "users": [
    {
      "id": "usr_abc123def456",
      "name": "Randall Gross",
      "email": "randall@rocketdigitalmarketing.io",
      "role": "admin"
    },
    {
      "id": "usr_xyz789ghi012",
      "name": "Eric Partner",
      "email": "eric@rocketdigitalmarketing.io",
      "role": "admin"
    }
  ],
  "count": 2
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId or emails array |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Batch-check which emails already have user accounts before bulk provisioning. Verify a user exists by exact email before sending an invite.

## Gotchas
This is a POST endpoint despite being a read operation (because the request body can be large). Email matching is exact and case-insensitive. Emails not found are silently omitted from the response — check the count to see how many matched.
