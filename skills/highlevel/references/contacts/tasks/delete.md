# Delete Contact Task

- **Method:** DELETE
- **Path:** `/contacts/{contactId}/tasks/{taskId}`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `contactId` | string | Yes | The ID of the contact |
| `taskId` | string | Yes | The ID of the task to delete |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/tasks/task_5xYzAbCdEfGh' \
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
| 400 | Bad Request — invalid contactId or taskId format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — task or contact does not exist |

## Common Use Cases
Remove tasks that are no longer relevant, such as cancelled follow-ups or duplicate entries.

## Gotchas
- This is a hard delete. There is no undo.
- The task must belong to the specified contact.
- Consider marking the task as completed instead of deleting it, to preserve a record of work done.
