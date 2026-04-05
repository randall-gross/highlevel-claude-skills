# Search/Filter Tasks

- **Method:** POST
- **Path:** `/locations/{locationId}/tasks/search`
- **Scopes:** `locations/tasks.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `assignedTo` | string | No | Filter by assigned user ID |
| `contactId` | string | No | Filter by contact ID |
| `status` | string | No | Filter by status (e.g., `incompleted`, `completed`) |
| `dueDate` | object | No | Date range filter |
| `dueDate.startDate` | string | No | Start date (ISO 8601) |
| `dueDate.endDate` | string | No | End date (ISO 8601) |
| `limit` | integer | No | Results per page (default: 25) |
| `skip` | integer | No | Number of results to skip |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/tasks/search' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "status": "incompleted",
    "assignedTo": "user_abc123",
    "dueDate": {
      "startDate": "2026-04-01T00:00:00.000Z",
      "endDate": "2026-04-30T23:59:59.999Z"
    },
    "limit": 20,
    "skip": 0
  }'
```

## Response Example

```json
{
  "tasks": [
    {
      "id": "task_xyz789",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "contactId": "contact_abc123",
      "title": "Follow up with John",
      "description": "Discuss proposal details",
      "assignedTo": "user_abc123",
      "dueDate": "2026-04-10T17:00:00.000Z",
      "status": "incompleted",
      "createdAt": "2026-04-01T10:00:00.000Z",
      "updatedAt": "2026-04-01T10:00:00.000Z"
    }
  ],
  "count": 1,
  "total": 1
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid parameters |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — location does not exist |
| 422 | Unprocessable Entity — invalid date format |

## Common Use Cases

Search for tasks by assignee, contact, status, or due date range. Used for building task dashboards, generating daily task lists, or auditing overdue items.

## Gotchas

- This is a POST endpoint despite being a read operation. The body contains the search/filter criteria.
- Status values are `incompleted` (not "incomplete") and `completed`. Note the "d" suffix.
- Pagination uses `skip`/`limit`. Use the `total` field in the response for page count calculations.
- Tasks are linked to contacts via `contactId`. A task without a `contactId` is a general location-level task.
