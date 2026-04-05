# Update Contact Task

- **Method:** PUT
- **Path:** `/contacts/{contactId}/tasks/{taskId}`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `contactId` | string | Yes | The ID of the contact |
| `taskId` | string | Yes | The ID of the task to update |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `title` | string | No | Updated task title |
| `dueDate` | string | No | Updated due date in ISO 8601 format |
| `description` | string | No | Updated task description |
| `assignedTo` | string | No | Updated user ID assignment |
| `completed` | boolean | No | Mark as completed or incomplete |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/tasks/task_5xYzAbCdEfGh' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "title": "Send revised proposal with discount",
    "dueDate": "2024-03-20",
    "description": "Include 10% discount as discussed on call"
  }'
```

## Response Example

```json
{
  "task": {
    "id": "task_5xYzAbCdEfGh",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "title": "Send revised proposal with discount",
    "description": "Include 10% discount as discussed on call",
    "dueDate": "2024-03-20T00:00:00.000Z",
    "assignedTo": "uKxMbLQ9f3cR7oPdWlNe",
    "completed": false,
    "dateAdded": "2024-03-01T10:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid field format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — task or contact does not exist |

## Common Use Cases
Reschedule a task, update the description after new information, or reassign to a different team member.

## Gotchas
- Only include fields you want to change. Omitted fields are left unchanged.
- You can set `completed` to true here, but consider using the dedicated `complete` endpoint which is more semantic.
- The `dateAdded` timestamp is never updated by this endpoint.
