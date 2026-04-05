# Remove Followers from Contact

- **Method:** DELETE
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
| `followers` | string[] | Yes | Array of user IDs to remove as followers |

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/followers' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "followers": ["uKxMbLQ9f3cR7oPdWlNe"]
  }'
```

## Response Example

```json
{
  "followers": ["vL2mNpQ3rS5uWxYzA1bC"],
  "followersRemoved": ["uKxMbLQ9f3cR7oPdWlNe"]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing followers array or empty array |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — contact does not exist |

## Common Use Cases
Unsubscribe team members from contact notifications when they are no longer responsible for that contact.

## Gotchas
- If a user ID is not currently a follower, it is silently ignored (no error).
- This is a DELETE method with a JSON body. Some HTTP clients require explicit configuration to send a body with DELETE requests.
- The `followers` array in the response shows the remaining followers after removal.
