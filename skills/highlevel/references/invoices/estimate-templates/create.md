# Create Estimate Template

- **Method:** POST
- **Path:** `/invoices/estimate/template`
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
| expiryDays | integer | No | Default days until estimate expires |

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location",
  "name": "Web Development Estimate Template",
  "items": [
    {
      "name": "Discovery & Planning",
      "description": "Requirements gathering and project planning",
      "quantity": 1,
      "unitPrice": 100000
    },
    {
      "name": "Design & Development",
      "description": "UI/UX design and frontend development",
      "quantity": 1,
      "unitPrice": 400000
    }
  ],
  "currency": "USD",
  "expiryDays": 30,
  "termsNotes": "Estimate valid for 30 days. 50% deposit required to begin work."
}
```

## Response Example
```json
{
  "template": {
    "_id": "etmpl_def456",
    "name": "Web Development Estimate Template",
    "locationId": "ve9EPM428h8vShlRW1KT",
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
Create reusable estimate templates for standard service packages to speed up quoting.

## Gotchas
- `unitPrice` in cents.
- `expiryDays` sets a default expiry relative to creation date when estimates are created from this template.
