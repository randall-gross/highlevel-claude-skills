# Complete Contact Task

- **Method:** PUT
- **Path:** `/contacts/{contactId}/tasks/{taskId}/completed`
- **Scopes:** `contacts.write`
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
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `completed` | boolean | Yes | Set to `true` to mark complete, `false` to reopen |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/tasks/task_5xYzAbCdEfGh/completed' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "completed": true
  }'
```

## Response Example

```json
{
  "task": {
    "id": "task_5xYzAbCdEfGh",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "title": "Send follow-up proposal",
    "completed": true,
    "dateAdded": "2024-03-01T10:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing completed field or invalid value |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — task or contact does not exist |

## Common Use Cases
Mark a task as done after completing the action, or reopen a task that was prematurely closed by setting `completed` to `false`.

## Gotchas
- You can also reopen a task by sending `{ "completed": false }`.
- This endpoint only changes the completion status. To update other fields (title, dueDate, etc.), use the `update` endpoint.
- Completing a task does not trigger HL workflows by default. If you need a trigger, add a tag change or use a custom webhook.
