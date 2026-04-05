# Create Invoice from Estimate

- **Method:** POST
- **Path:** `/invoices/estimate/{estimateId}/invoice`
- **Scopes:** `invoices/estimate.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| estimateId | string | Yes | Estimate ID |

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
  "invoice": {
    "_id": "inv_def456",
    "name": "Website Redesign Estimate",
    "status": "draft",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "total": 500000,
    "sourceEstimateId": "est_abc123",
    "createdAt": "2026-04-04T12:00:00.000Z"
  },
  "estimate": {
    "_id": "est_abc123",
    "status": "invoiced"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId/altType or estimate not in convertible state |
| 401 | Unauthorized — invalid or expired token |
| 404 | Estimate not found |
| 422 | Estimate already invoiced or not accepted |

## Common Use Cases
Convert an accepted estimate into an invoice, copying all line items and contact details. This is the standard estimate-to-invoice workflow.

## Gotchas
- Estimate should be in `accepted` status (some implementations allow `sent`).
- The estimate transitions to `invoiced` status and cannot be converted again.
- The new invoice is created as `draft` — you must send it separately.
- Line items, contact, and terms are copied from the estimate.
