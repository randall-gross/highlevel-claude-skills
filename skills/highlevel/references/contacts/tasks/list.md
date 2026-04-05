# List Contact Tasks

- **Method:** GET
- **Path:** `/contacts/{contactId}/tasks`
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
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/tasks' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "tasks": [
    {
      "id": "task_5xYzAbCdEfGh",
      "contactId": "nmFmQEsNgz6AVpgLVUJ0",
      "title": "Send follow-up proposal",
      "description": "Include updated pricing for premium plan",
      "dueDate": "2024-03-15T17:00:00.000Z",
      "assignedTo": "uKxMbLQ9f3cR7oPdWlNe",
      "completed": false,
      "dateAdded": "2024-03-01T10:00:00.000Z"
    },
    {
      "id": "task_2aBcDeFgHiJk",
      "contactId": "nmFmQEsNgz6AVpgLVUJ0",
      "title": "Schedule demo call",
      "description": "",
      "dueDate": "2024-03-10T14:00:00.000Z",
      "assignedTo": "uKxMbLQ9f3cR7oPdWlNe",
      "completed": true,
      "dateAdded": "2024-02-28T09:30:00.000Z"
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
Display a task list for a contact in a CRM detail view, or check for overdue tasks.

## Gotchas
- Returns both completed and incomplete tasks. Filter client-side by the `completed` field if needed.
- There is no built-in pagination. All tasks for the contact are returned in a single response.
- Due dates are in UTC. Convert to the contact's timezone for display.
