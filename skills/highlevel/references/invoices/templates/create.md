# Create Invoice Template

- **Method:** POST
- **Path:** `/invoices/template`
- **Scopes:** `invoices/template.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |
| name | string | Yes | Template name |
| items | array | Yes | Default line items |
| items[].name | string | Yes | Item name |
| items[].description | string | No | Item description |
| items[].quantity | integer | Yes | Default quantity |
| items[].unitPrice | integer | Yes | Default unit price in cents |
| currency | string | No | Currency code (default: USD) |
| termsNotes | string | No | Default terms and notes |

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location",
  "name": "Monthly Retainer Template",
  "items": [
    {
      "name": "Monthly Marketing Retainer",
      "description": "SEO, PPC, and social media management",
      "quantity": 1,
      "unitPrice": 250000
    }
  ],
  "currency": "USD",
  "termsNotes": "Payment due within 15 days of invoice date"
}
```

## Response Example
```json
{
  "template": {
    "_id": "tmpl_def456",
    "name": "Monthly Retainer Template",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "currency": "USD",
    "createdAt": "2026-04-04T12:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 422 | Validation error |

## Common Use Cases
Create reusable invoice templates for recurring service types to speed up invoice creation.

## Gotchas
- `unitPrice` in cents (250000 = $2,500.00).
- Templates are location-scoped.
