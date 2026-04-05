# Create Contact Task

- **Method:** POST
- **Path:** `/contacts/{contactId}/tasks`
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
| `title` | string | Yes | Task title |
| `dueDate` | string | Yes | Due date in ISO 8601 format (e.g., `2024-03-15`) |
| `description` | string | No | Task description |
| `assignedTo` | string | No | User ID to assign the task to |
| `completed` | boolean | No | Whether the task starts as completed (default false) |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/tasks' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "title": "Send follow-up proposal",
    "dueDate": "2024-03-15",
    "description": "Include updated pricing for premium plan",
    "assignedTo": "uKxMbLQ9f3cR7oPdWlNe"
  }'
```

## Response Example

```json
{
  "task": {
    "id": "task_5xYzAbCdEfGh",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "title": "Send follow-up proposal",
    "description": "Include updated pricing for premium plan",
    "dueDate": "2024-03-15T00:00:00.000Z",
    "assignedTo": "uKxMbLQ9f3cR7oPdWlNe",
    "completed": false,
    "dateAdded": "2024-03-05T12:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing title or dueDate |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — contact does not exist |
| 422 | Unprocessable Entity — invalid assignedTo user ID |

## Common Use Cases
Create follow-up tasks for sales reps after a call or meeting, or auto-create tasks from workflow triggers.

## Gotchas
- The `dueDate` can be just a date (`2024-03-15`) or a full ISO datetime. If only a date is provided, time defaults to midnight UTC.
- The `assignedTo` must be a valid user ID in the sub-account. Invalid IDs return a 422.
- Tasks created via the API appear in the HL UI under the contact's task tab and in the assigned user's task list.
