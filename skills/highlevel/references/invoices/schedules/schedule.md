# Activate Schedule

- **Method:** POST
- **Path:** `/invoices/schedule/{scheduleId}/schedule`
- **Scopes:** `invoices/schedule.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| scheduleId | string | Yes | Schedule ID |

### Body Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location"
}
```

## Response Example
```json
{
  "schedule": {
    "_id": "sched_abc123",
    "status": "active",
    "nextRunAt": "2026-05-01T00:00:00.000Z",
    "activatedAt": "2026-04-04T12:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId/altType or schedule not in activatable state |
| 401 | Unauthorized — invalid or expired token |
| 404 | Schedule not found |
| 422 | Schedule already active or missing required configuration |

## Common Use Cases
Activate a draft recurring schedule so it begins generating and sending invoices on the configured frequency.

## Gotchas
- Schedule must be in `draft` status. Already active schedules return an error.
- The first invoice is generated on the `startDate`, not immediately upon activation.
- Ensure the contact has a valid email before activating.
