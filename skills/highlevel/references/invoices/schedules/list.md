# List Schedules

- **Method:** GET
- **Path:** `/invoices/schedule`
- **Scopes:** `invoices/schedule.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |
| limit | integer | No | Number of results (default 20, max 100) |
| offset | integer | No | Pagination offset |

## Request Example
```bash
curl -X GET "https://services.leadconnectorhq.com/invoices/schedule?altId=ve9EPM428h8vShlRW1KT&altType=location" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example
```json
{
  "schedules": [
    {
      "_id": "sched_abc123",
      "name": "Monthly Retainer",
      "status": "active",
      "contactId": "nmFmQEsNgz6AVpgLVUJ0",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "frequency": "monthly",
      "nextRunAt": "2026-05-01T00:00:00.000Z",
      "total": 250000,
      "createdAt": "2026-04-01T12:00:00.000Z"
    }
  ],
  "total": 1
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId or altType |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
List all recurring invoice schedules for a location to manage subscription-style billing.

## Gotchas
- Returns both active and inactive schedules. Filter by `status` client-side if needed.
