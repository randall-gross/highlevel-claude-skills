# Create Invoice

- **Method:** POST
- **Path:** `/invoices/`
- **Scopes:** `invoices.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| contactId | string | Yes | Contact ID |
| name | string | Yes | Invoice name/title |
| items | array | Yes | Array of line items |
| items[].name | string | Yes | Item name |
| items[].description | string | No | Item description |
| items[].quantity | integer | Yes | Quantity |
| items[].unitPrice | integer | Yes | Unit price in cents |
| dueDate | string | Yes | Due date (ISO 8601) |
| currency | string | No | Currency code (default: USD) |
| discount | object | No | Discount configuration |
| termsNotes | string | No | Terms and notes |
| invoiceNumber | string | No | Custom invoice number |

## Request Example
```json
{
  "locationId": "ve9EPM428h8vShlRW1KT",
  "contactId": "nmFmQEsNgz6AVpgLVUJ0",
  "name": "Web Design Invoice",
  "items": [
    {
      "name": "Homepage Redesign",
      "description": "Complete homepage redesign with responsive layout",
      "quantity": 1,
      "unitPrice": 250000
    },
    {
      "name": "SEO Optimization",
      "quantity": 1,
      "unitPrice": 50000
    }
  ],
  "dueDate": "2026-05-01T00:00:00.000Z",
  "currency": "USD",
  "termsNotes": "Payment due within 30 days"
}
```

## Response Example
```json
{
  "invoice": {
    "_id": "inv_abc123",
    "name": "Web Design Invoice",
    "invoiceNumber": "002",
    "status": "draft",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "currency": "USD",
    "total": 300000,
    "amountDue": 300000,
    "dueDate": "2026-05-01T00:00:00.000Z",
    "createdAt": "2026-04-04T12:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing required fields or invalid data |
| 401 | Unauthorized — invalid or expired token |
| 422 | Validation error (e.g., invalid contactId) |

## Common Use Cases
Create a new invoice for a contact with line items, typically after completing work or as part of a billing workflow.

## Gotchas
- `unitPrice` is in cents (250000 = $2,500.00).
- Invoice is created in `draft` status. You must call the send endpoint separately.
- If `invoiceNumber` is omitted, the system auto-generates the next sequential number.
