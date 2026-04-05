# Delete Contact Note

- **Method:** DELETE
- **Path:** `/contacts/{contactId}/notes/{id}`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `contactId` | string | Yes | The ID of the contact |
| `id` | string | Yes | The ID of the note to delete |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/notes/note_8kLmNpQ2rS4u' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "succeeded": true
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid contactId or note ID format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — note or contact does not exist |

## Common Use Cases
Remove incorrect or outdated notes from a contact record.

## Gotchas
- This is a hard delete. There is no undo or soft-delete.
- The note must belong to the specified contact. You cannot delete a note using a different contact's ID.
