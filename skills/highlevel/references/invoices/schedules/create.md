# Create Schedule

- **Method:** POST
- **Path:** `/invoices/schedule`
- **Scopes:** `invoices/schedule.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |
| contactId | string | Yes | Contact ID |
| name | string | Yes | Schedule name |
| items | array | Yes | Line items for each generated invoice |
| items[].name | string | Yes | Item name |
| items[].description | string | No | Item description |
| items[].quantity | integer | Yes | Quantity |
| items[].unitPrice | integer | Yes | Unit price in cents |
| frequency | string | Yes | `weekly`, `monthly`, `yearly` |
| startDate | string | Yes | First invoice date (ISO 8601) |
| endDate | string | No | End date (ISO 8601), omit for indefinite |
| currency | string | No | Currency code (default: USD) |
| termsNotes | string | No | Terms and notes for generated invoices |
| numberOfPayments | integer | No | Total number of invoices to generate |

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location",
  "contactId": "nmFmQEsNgz6AVpgLVUJ0",
  "name": "Monthly SEO Retainer",
  "items": [
    {
      "name": "SEO Management",
      "description": "Monthly search engine optimization services",
      "quantity": 1,
      "unitPrice": 150000
    }
  ],
  "frequency": "monthly",
  "startDate": "2026-05-01T00:00:00.000Z",
  "currency": "USD"
}
```

## Response Example
```json
{
  "schedule": {
    "_id": "sched_def456",
    "name": "Monthly SEO Retainer",
    "status": "draft",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "frequency": "monthly",
    "nextRunAt": "2026-05-01T00:00:00.000Z",
    "total": 150000,
    "createdAt": "2026-04-04T12:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 422 | Validation error (e.g., invalid frequency, past startDate) |

## Common Use Cases
Set up recurring billing for retainer clients, subscriptions, or installment payments.

## Gotchas
- Schedule is created in `draft` status. You must activate it with the schedule endpoint.
- `unitPrice` in cents.
- Either `endDate` or `numberOfPayments` can limit the schedule, but not both.
