# Update Contact Note

- **Method:** PUT
- **Path:** `/contacts/{contactId}/notes/{id}`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `contactId` | string | Yes | The ID of the contact |
| `id` | string | Yes | The ID of the note to update |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `body` | string | Yes | The updated note text content |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/notes/note_8kLmNpQ2rS4u' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "body": "Called customer to follow up on proposal. Left voicemail. Will try again Thursday."
  }'
```

## Response Example

```json
{
  "note": {
    "id": "note_8kLmNpQ2rS4u",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "body": "Called customer to follow up on proposal. Left voicemail. Will try again Thursday.",
    "userId": "uKxMbLQ9f3cR7oPdWlNe",
    "dateAdded": "2024-02-20T14:30:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing body field or empty string |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — note or contact does not exist |

## Common Use Cases
Correct or append information to an existing note.

## Gotchas
- The `body` field completely replaces the existing note text. There is no append mode.
- The `dateAdded` timestamp is NOT updated on edit. It reflects the original creation time.
- The `userId` cannot be changed after creation.
