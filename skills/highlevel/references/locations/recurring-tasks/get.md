# Get Recurring Task

- **Method:** GET
- **Path:** `/locations/{locationId}/recurring-tasks/{id}`
- **Scopes:** `locations/tasks.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |
| `id` | string | Yes | The recurring task ID |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/recurring-tasks/rt_abc123' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "recurringTask": {
    "id": "rt_abc123",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "title": "Weekly Follow-Up",
    "description": "Check in with all active leads",
    "assignedTo": "user_abc123",
    "dueIn": 7,
    "dueInUnit": "days",
    "recurrence": {
      "frequency": "weekly",
      "interval": 1,
      "dayOfWeek": ["monday"]
    },
    "status": "active",
    "createdAt": "2026-01-15T10:00:00.000Z",
    "updatedAt": "2026-01-15T10:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid ID format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — recurring task does not exist |

## Common Use Cases

Retrieve details of a recurring task to verify its schedule and assignment before making changes.

## Gotchas

- The `assignedTo` field references a user ID within the location, not a contact ID.
- `dueIn` + `dueInUnit` define how long after creation each task instance is due.
