# Update Template Payment Methods Configuration

- **Method:** PATCH
- **Path:** `/invoices/template/{templateId}/payment-methods-configuration`
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
| bankTransfer | object | No | Bank transfer settings |
| bankTransfer.enabled | boolean | No | Enable bank transfer payments |
| creditCard | object | No | Credit card settings |
| creditCard.enabled | boolean | No | Enable credit card payments |
| ach | object | No | ACH settings |
| ach.enabled | boolean | No | Enable ACH payments |

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location",
  "creditCard": {
    "enabled": true
  },
  "ach": {
    "enabled": true
  },
  "bankTransfer": {
    "enabled": false
  }
}
```

## Response Example
```json
{
  "template": {
    "_id": "tmpl_abc123",
    "paymentMethodsConfiguration": {
      "creditCard": { "enabled": true },
      "ach": { "enabled": true },
      "bankTransfer": { "enabled": false }
    }
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId/altType or invalid configuration |
| 401 | Unauthorized — invalid or expired token |
| 404 | Template not found |
| 422 | Payment provider not configured for location |

## Common Use Cases
Configure which payment methods are available on invoices created from this template.

## Gotchas
- Payment methods must be configured at the location level first (e.g., Stripe connected) before they can be enabled on templates.
- At least one payment method should remain enabled if the template is used for sendable invoices.
