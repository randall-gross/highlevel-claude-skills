# Update Invoice Template

- **Method:** PUT
- **Path:** `/invoices/template/{templateId}`
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

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location",
  "name": "Updated Retainer Template",
  "items": [
    {
      "name": "Monthly Marketing Retainer",
      "quantity": 1,
      "unitPrice": 300000
    }
  ]
}
```

## Response Example
```json
{
  "template": {
    "_id": "tmpl_def456",
    "name": "Updated Retainer Template",
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
Update default line items or terms on an existing template.

## Gotchas
- The `items` array replaces all existing items — not a partial merge.
- Updating a template does not affect invoices already created from it.
