# Get Invoice Template

- **Method:** GET
- **Path:** `/invoices/template/{templateId}`
- **Scopes:** `invoices/template.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| templateId | string | Yes | Template ID |

### Query Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |

## Request Example
```bash
curl -X GET "https://services.leadconnectorhq.com/invoices/template/tmpl_abc123?altId=ve9EPM428h8vShlRW1KT&altType=location" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example
```json
{
  "template": {
    "_id": "tmpl_abc123",
    "name": "Standard Service Invoice",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "currency": "USD",
    "items": [
      {
        "name": "Service Fee",
        "description": "Monthly service retainer",
        "quantity": 1,
        "unitPrice": 10000
      }
    ],
    "termsNotes": "Payment due within 30 days",
    "lateFeeConfiguration": {
      "enabled": false
    },
    "createdAt": "2026-03-01T12:00:00.000Z",
    "updatedAt": "2026-03-15T12:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId or altType |
| 401 | Unauthorized — invalid or expired token |
| 404 | Template not found |

## Common Use Cases
Retrieve full template details to pre-populate an invoice creation form.

## Gotchas
- Requires `altId`/`altType` query params in addition to the path parameter.
