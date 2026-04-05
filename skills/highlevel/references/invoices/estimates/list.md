# List Estimates

- **Method:** GET
- **Path:** `/invoices/estimate/list`
- **Scopes:** `invoices/estimate.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |
| status | string | No | Filter by status (draft, sent, accepted, declined, invoiced) |
| contactId | string | No | Filter by contact ID |
| search | string | No | Search by estimate name or number |
| startAt | string | No | Start date filter (ISO 8601) |
| endAt | string | No | End date filter (ISO 8601) |
| limit | integer | No | Number of results (default 20, max 100) |
| offset | integer | No | Pagination offset |

## Request Example
```bash
curl -X GET "https://services.leadconnectorhq.com/invoices/estimate/list?altId=ve9EPM428h8vShlRW1KT&altType=location&limit=20" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example
```json
{
  "estimates": [
    {
      "_id": "est_abc123",
      "name": "Estimate #001",
      "estimateNumber": "001",
      "status": "sent",
      "contactId": "nmFmQEsNgz6AVpgLVUJ0",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "currency": "USD",
      "total": 500000,
      "expiryDate": "2026-05-01T00:00:00.000Z",
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
| 422 | Invalid query parameters |

## Common Use Cases
Retrieve a list of estimates for a location, filtered by status or contact.

## Gotchas
- Uses `altId`/`altType` pattern instead of `locationId` like the core invoices endpoint.
- Path is `/invoices/estimate/list` (not just `/invoices/estimate/`).
- Amounts in cents.
