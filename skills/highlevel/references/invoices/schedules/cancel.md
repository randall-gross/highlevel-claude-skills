# Cancel Schedule

- **Method:** POST
- **Path:** `/invoices/schedule/{scheduleId}/cancel`
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
    "status": "cancelled",
    "cancelledAt": "2026-04-04T12:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId/altType or schedule not active |
| 401 | Unauthorized — invalid or expired token |
| 404 | Schedule not found |

## Common Use Cases
Stop a recurring schedule from generating future invoices, such as when a client cancels their retainer.

## Gotchas
- Only `active` schedules can be cancelled.
- Cancellation stops future invoice generation but does not void already-generated invoices.
- Cancelled schedules cannot be reactivated — create a new schedule instead.
