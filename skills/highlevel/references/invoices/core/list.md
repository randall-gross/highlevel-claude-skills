# List Invoices

- **Method:** GET
- **Path:** `/invoices/`
- **Scopes:** `invoices.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| status | string | No | Filter by status (draft, sent, paid, void, partially_paid) |
| contactId | string | No | Filter by contact ID |
| search | string | No | Search by invoice name or number |
| startAt | string | No | Start date filter (ISO 8601) |
| endAt | string | No | End date filter (ISO 8601) |
| limit | integer | No | Number of results (default 20, max 100) |
| offset | integer | No | Pagination offset |

## Request Example
```bash
curl -X GET "https://services.leadconnectorhq.com/invoices/?locationId=ve9EPM428h8vShlRW1KT&status=sent&limit=20&offset=0" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example
```json
{
  "invoices": [
    {
      "_id": "inv_abc123",
      "name": "Invoice #001",
      "invoiceNumber": "001",
      "status": "sent",
      "contactId": "nmFmQEsNgz6AVpgLVUJ0",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "currency": "USD",
      "total": 15000,
      "amountDue": 15000,
      "dueDate": "2026-05-01T00:00:00.000Z",
      "createdAt": "2026-04-01T12:00:00.000Z",
      "updatedAt": "2026-04-01T12:00:00.000Z"
    }
  ],
  "total": 1
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing or invalid locationId |
| 401 | Unauthorized — invalid or expired token |
| 422 | Invalid query parameters |

## Common Use Cases
Retrieve a filtered list of invoices for a location, useful for dashboard views and reporting.

## Gotchas
- `total` amounts are in cents (15000 = $150.00). Always divide by 100 for display.
- `startAt` and `endAt` filter on creation date, not due date.
