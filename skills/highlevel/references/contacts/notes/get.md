# Get Contact Note

- **Method:** GET
- **Path:** `/contacts/{contactId}/notes/{id}`
- **Scopes:** `contacts.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `contactId` | string | Yes | The ID of the contact |
| `id` | string | Yes | The ID of the note |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/notes/note_8kLmNpQ2rS4u' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "note": {
    "id": "note_8kLmNpQ2rS4u",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "body": "Called customer to follow up on proposal. Left voicemail.",
    "userId": "uKxMbLQ9f3cR7oPdWlNe",
    "dateAdded": "2024-02-20T14:30:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid contactId or note ID format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — note or contact does not exist |

## Common Use Cases
Retrieve a specific note for editing or display in a detail view.

## Gotchas
- The note must belong to the specified contact. You cannot retrieve a note using a different contact's ID.
