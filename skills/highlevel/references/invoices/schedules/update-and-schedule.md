# Update and Re-Schedule

- **Method:** POST
- **Path:** `/invoices/schedule/{scheduleId}/updateAndSchedule`
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
| name | string | No | Schedule name |
| items | array | No | Updated line items |
| items[].name | string | Yes | Item name |
| items[].quantity | integer | Yes | Quantity |
| items[].unitPrice | integer | Yes | Unit price in cents |
| frequency | string | No | `weekly`, `monthly`, `yearly` |
| endDate | string | No | New end date (ISO 8601) |
| numberOfPayments | integer | No | Updated total number of invoices |

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location",
  "items": [
    {
      "name": "SEO Management - Premium",
      "quantity": 1,
      "unitPrice": 300000
    }
  ]
}
```

## Response Example
```json
{
  "schedule": {
    "_id": "sched_abc123",
    "name": "Monthly SEO Retainer",
    "status": "active",
    "total": 300000,
    "nextRunAt": "2026-05-01T00:00:00.000Z",
    "updatedAt": "2026-04-04T14:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId/altType or invalid data |
| 401 | Unauthorized — invalid or expired token |
| 404 | Schedule not found |
| 422 | Validation error |

## Common Use Cases
Update line items or terms on an active schedule without having to cancel and recreate it. Common for price adjustments mid-contract.

## Gotchas
- This is the only way to update an active schedule. The regular PUT update endpoint rejects active schedules.
- Changes apply to the next generated invoice onward. Already-generated invoices are not affected.
- The `items` array is a full replacement.
