# Get Contact Task

- **Method:** GET
- **Path:** `/contacts/{contactId}/tasks/{taskId}`
- **Scopes:** `contacts.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `contactId` | string | Yes | The ID of the contact |
| `taskId` | string | Yes | The ID of the task |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/tasks/task_5xYzAbCdEfGh' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "task": {
    "id": "task_5xYzAbCdEfGh",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "title": "Send follow-up proposal",
    "description": "Include updated pricing for premium plan",
    "dueDate": "2024-03-15T17:00:00.000Z",
    "assignedTo": "uKxMbLQ9f3cR7oPdWlNe",
    "completed": false,
    "dateAdded": "2024-03-01T10:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid contactId or taskId format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — task or contact does not exist |

## Common Use Cases
Retrieve task details for editing in a custom UI, or check completion status before triggering a follow-up action.

## Gotchas
- The task must belong to the specified contact. You cannot retrieve a task using a different contact's ID.
