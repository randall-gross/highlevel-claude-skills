# Update Estimate Template

- **Method:** PUT
- **Path:** `/invoices/estimate/template/{templateId}`
- **Scopes:** `invoices/template.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| templateId | string | Yes | Template ID |

### Body Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |
| name | string | No | Template name |
| items | array | No | Default line items |
| currency | string | No | Currency code |
| termsNotes | string | No | Default terms and notes |
| expiryDays | integer | No | Default days until estimate expires |

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location",
  "name": "Updated Web Development Estimate",
  "items": [
    {
      "name": "Full Service Package",
      "quantity": 1,
      "unitPrice": 600000
    }
  ]
}
```

## Response Example
```json
{
  "template": {
    "_id": "etmpl_def456",
    "name": "Updated Web Development Estimate",
    "updatedAt": "2026-04-04T14:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId/altType or invalid data |
| 401 | Unauthorized — invalid or expired token |
| 404 | Template not found |

## Common Use Cases
Update pricing or line items on an existing estimate template.

## Gotchas
- The `items` array is a full replacement, not a partial merge.
- Does not affect estimates already created from this template.
