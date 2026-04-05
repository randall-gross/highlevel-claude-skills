# Create Recurring Task

- **Method:** POST
- **Path:** `/locations/{locationId}/recurring-tasks`
- **Scopes:** `locations/tasks.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `title` | string | Yes | Task title |
| `description` | string | No | Task description |
| `assignedTo` | string | No | User ID to assign to |
| `dueIn` | integer | No | Time until due |
| `dueInUnit` | string | No | Unit for dueIn: `minutes`, `hours`, `days` |
| `recurrence` | object | Yes | Recurrence configuration |
| `recurrence.frequency` | string | Yes | `daily`, `weekly`, `monthly` |
| `recurrence.interval` | integer | No | Repeat every N frequency units (default: 1) |
| `recurrence.dayOfWeek` | string[] | Conditional | Required for weekly (e.g., `["monday", "friday"]`) |
| `recurrence.dayOfMonth` | integer | Conditional | Required for monthly (1-31) |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/recurring-tasks' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "title": "Monthly Review",
    "description": "Review all pipeline stages",
    "assignedTo": "user_abc123",
    "dueIn": 3,
    "dueInUnit": "days",
    "recurrence": {
      "frequency": "monthly",
      "interval": 1,
      "dayOfMonth": 1
    }
  }'
```

## Response Example

```json
{
  "recurringTask": {
    "id": "rt_new456",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "title": "Monthly Review",
    "description": "Review all pipeline stages",
    "assignedTo": "user_abc123",
    "dueIn": 3,
    "dueInUnit": "days",
    "recurrence": {
      "frequency": "monthly",
      "interval": 1,
      "dayOfMonth": 1
    },
    "status": "active",
    "createdAt": "2026-04-01T10:00:00.000Z",
    "updatedAt": "2026-04-01T10:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — invalid recurrence configuration |

## Common Use Cases

Set up automated recurring tasks for team members, such as weekly lead follow-ups or monthly pipeline reviews.

## Gotchas

- `dayOfWeek` is required when frequency is `weekly`; `dayOfMonth` is required when frequency is `monthly`.
- Day names in `dayOfWeek` must be lowercase full names (e.g., `monday`, not `Mon` or `MONDAY`).
- If `dayOfMonth` is 31 and the month has fewer days, the task generates on the last day of the month.
