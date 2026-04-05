# Delete Contact

- **Method:** DELETE
- **Path:** `/contacts/{contactId}`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `contactId` | string | Yes | The ID of the contact to delete |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0' \
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
| 400 | Bad Request — invalid contactId format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — contact does not exist |

## Common Use Cases
Remove a contact that was created in error, or as part of a GDPR data deletion request.

## Gotchas
- **This is a hard delete.** The contact and all associated data (notes, tasks, appointments) are permanently removed. There is no soft-delete or undo.
- **Opportunities become orphaned.** If the contact had linked opportunities, those opportunities will lose their `contactId` reference but will NOT be deleted.
- Conversations associated with the contact are also removed.
- There is no bulk delete endpoint. To delete multiple contacts, you must call this endpoint once per contact.
