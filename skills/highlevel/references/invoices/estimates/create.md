# Create Estimate

- **Method:** POST
- **Path:** `/invoices/estimate`
- **Scopes:** `invoices/estimate.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |
| contactId | string | Yes | Contact ID |
| name | string | Yes | Estimate name/title |
| items | array | Yes | Array of line items |
| items[].name | string | Yes | Item name |
| items[].description | string | No | Item description |
| items[].quantity | integer | Yes | Quantity |
| items[].unitPrice | integer | Yes | Unit price in cents |
| expiryDate | string | No | Expiry date (ISO 8601) |
| currency | string | No | Currency code (default: USD) |
| termsNotes | string | No | Terms and notes |

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location",
  "contactId": "nmFmQEsNgz6AVpgLVUJ0",
  "name": "Website Redesign Estimate",
  "items": [
    {
      "name": "Full Website Redesign",
      "description": "10-page responsive website with CMS",
      "quantity": 1,
      "unitPrice": 500000
    }
  ],
  "expiryDate": "2026-05-01T00:00:00.000Z",
  "currency": "USD"
}
```

## Response Example
```json
{
  "estimate": {
    "_id": "est_abc123",
    "name": "Website Redesign Estimate",
    "estimateNumber": "001",
    "status": "draft",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "total": 500000,
    "createdAt": "2026-04-04T12:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 422 | Validation error (e.g., invalid contactId) |

## Common Use Cases
Create a new estimate/quote for a prospective client before converting to an invoice.

## Gotchas
- Created in `draft` status. Must be sent separately.
- `unitPrice` in cents (500000 = $5,000.00).
- Uses `altId`/`altType` instead of `locationId`.
