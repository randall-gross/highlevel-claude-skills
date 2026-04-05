# Update Schedule

- **Method:** PUT
- **Path:** `/invoices/schedule/{scheduleId}`
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
| items | array | No | Line items |
| frequency | string | No | `weekly`, `monthly`, `yearly` |
| endDate | string | No | End date (ISO 8601) |
| currency | string | No | Currency code |
| termsNotes | string | No | Terms and notes |
| numberOfPayments | integer | No | Total number of invoices |

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location",
  "items": [
    {
      "name": "SEO Management",
      "quantity": 1,
      "unitPrice": 200000
    }
  ]
}
```

## Response Example
```json
{
  "schedule": {
    "_id": "sched_def456",
    "name": "Monthly SEO Retainer",
    "total": 200000,
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
| 422 | Cannot update active schedule (use updateAndSchedule instead) |

## Common Use Cases
Modify a draft schedule's line items or frequency before activation.

## Gotchas
- Only `draft` or `paused` schedules can be updated with this endpoint. For active schedules, use the `updateAndSchedule` endpoint.
- The `items` array is a full replacement.
