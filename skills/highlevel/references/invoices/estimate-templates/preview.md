# Preview Estimate Template

- **Method:** GET
- **Path:** `/invoices/estimate/template/preview`
- **Scopes:** `invoices/template.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |
| templateId | string | Yes | Template ID to preview |

## Request Example
```bash
curl -X GET "https://services.leadconnectorhq.com/invoices/estimate/template/preview?altId=ve9EPM428h8vShlRW1KT&altType=location&templateId=etmpl_abc123" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example
```json
{
  "preview": {
    "html": "<html>...</html>",
    "templateId": "etmpl_abc123",
    "name": "Web Development Estimate Template",
    "items": [
      {
        "name": "Discovery & Planning",
        "quantity": 1,
        "unitPrice": 100000
      }
    ],
    "total": 100000
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing required query parameters |
| 401 | Unauthorized — invalid or expired token |
| 404 | Template not found |

## Common Use Cases
Preview how an estimate template will look when rendered, useful for template selection UIs.

## Gotchas
- The `html` field contains a full HTML preview suitable for rendering in an iframe.
- Preview uses placeholder data for contact-specific fields.
