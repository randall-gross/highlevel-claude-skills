# List Contact Notes

- **Method:** GET
- **Path:** `/contacts/{contactId}/notes`
- **Scopes:** `contacts.readonly`
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
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/notes' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "notes": [
    {
      "id": "note_8kLmNpQ2rS4u",
      "contactId": "nmFmQEsNgz6AVpgLVUJ0",
      "body": "Called customer to follow up on proposal. Left voicemail.",
      "userId": "uKxMbLQ9f3cR7oPdWlNe",
      "dateAdded": "2024-02-20T14:30:00.000Z"
    },
    {
      "id": "note_3aB4cDeF5gH6",
      "contactId": "nmFmQEsNgz6AVpgLVUJ0",
      "body": "Customer requested a revised quote with 10% discount.",
      "userId": "uKxMbLQ9f3cR7oPdWlNe",
      "dateAdded": "2024-02-18T09:15:00.000Z"
    }
  ],
  "total": 2
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid contactId format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — contact does not exist |

## Common Use Cases
Display a timeline of notes for a contact in a CRM detail view.

## Gotchas
- Notes are returned in reverse chronological order (newest first).
- The `userId` field references the HL user who created the note, which may be a sub-account user or an API integration.
- There is no built-in pagination on this endpoint. All notes are returned in a single response.
