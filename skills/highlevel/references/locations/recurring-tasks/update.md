# Update Recurring Task

- **Method:** PUT
- **Path:** `/locations/{locationId}/recurring-tasks/{id}`
- **Scopes:** `locations/tasks.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |
| `id` | string | Yes | The recurring task ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `title` | string | No | Task title |
| `description` | string | No | Task description |
| `assignedTo` | string | No | User ID to assign to |
| `dueIn` | integer | No | Time until due |
| `dueInUnit` | string | No | Unit for dueIn |
| `recurrence` | object | No | Recurrence configuration |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/recurring-tasks/rt_new456' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "title": "Bi-Monthly Review",
    "recurrence": {
      "frequency": "monthly",
      "interval": 2,
      "dayOfMonth": 15
    }
  }'
```

## Response Example

```json
{
  "recurringTask": {
    "id": "rt_new456",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "title": "Bi-Monthly Review",
    "description": "Review all pipeline stages",
    "assignedTo": "user_abc123",
    "dueIn": 3,
    "dueInUnit": "days",
    "recurrence": {
      "frequency": "monthly",
      "interval": 2,
      "dayOfMonth": 15
    },
    "status": "active",
    "updatedAt": "2026-04-04T10:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid parameters |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — recurring task does not exist |
| 422 | Unprocessable Entity — invalid recurrence configuration |

## Common Use Cases

Change the schedule, assignment, or details of a recurring task without recreating it.

## Gotchas

- Updating the recurrence schedule affects only future task instances. Already-generated instances are not modified or deleted.
- Send the full `recurrence` object when updating schedule; partial recurrence updates may not work as expected.
