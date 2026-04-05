# Add Followers to Contact

- **Method:** POST
- **Path:** `/contacts/{contactId}/followers`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `contactId` | string | Yes | The ID of the contact |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `followers` | string[] | Yes | Array of user IDs to add as followers |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/followers' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "followers": ["uKxMbLQ9f3cR7oPdWlNe", "vL2mNpQ3rS5uWxYzA1bC"]
  }'
```

## Response Example

```json
{
  "followers": ["uKxMbLQ9f3cR7oPdWlNe", "vL2mNpQ3rS5uWxYzA1bC"],
  "followersAdded": ["vL2mNpQ3rS5uWxYzA1bC"]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing followers array or empty array |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — contact does not exist |
| 422 | Unprocessable Entity — one or more user IDs are invalid |

## Common Use Cases
Subscribe team members to a contact so they receive notifications about activity on that contact (new messages, appointments, etc.).

## Gotchas
- Followers must be valid user IDs in the sub-account. Invalid IDs return a 422.
- If a user is already a follower, they are silently skipped (no error, no duplicate).
- Followers receive notifications in the HL UI and optionally via email/SMS depending on their notification settings.
- The `followersAdded` array in the response shows only newly added followers, not ones that were already following.
