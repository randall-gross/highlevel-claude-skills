# Get Schedule

- **Method:** GET
- **Path:** `/invoices/schedule/{scheduleId}`
- **Scopes:** `invoices/schedule.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| scheduleId | string | Yes | Schedule ID |

### Query Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |

## Request Example
```bash
curl -X GET "https://services.leadconnectorhq.com/invoices/schedule/sched_abc123?altId=ve9EPM428h8vShlRW1KT&altType=location" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example
```json
{
  "schedule": {
    "_id": "sched_abc123",
    "name": "Monthly Retainer",
    "status": "active",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "frequency": "monthly",
    "items": [
      {
        "name": "Monthly Marketing Retainer",
        "quantity": 1,
        "unitPrice": 250000
      }
    ],
    "total": 250000,
    "nextRunAt": "2026-05-01T00:00:00.000Z",
    "lastRunAt": "2026-04-01T00:00:00.000Z",
    "autoPayment": {
      "enabled": false
    },
    "createdAt": "2026-01-01T12:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId or altType |
| 401 | Unauthorized — invalid or expired token |
| 404 | Schedule not found |

## Common Use Cases
Retrieve full details of a recurring schedule including next run date and payment history.

## Gotchas
- Requires `altId`/`altType` query params in addition to the path parameter.
