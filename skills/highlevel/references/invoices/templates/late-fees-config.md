# Update Template Late Fees Configuration

- **Method:** PATCH
- **Path:** `/invoices/template/{templateId}/late-fees-configuration`
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
| enabled | boolean | Yes | Enable/disable late fees |
| feeType | string | No | `percentage` or `flat` |
| feeAmount | integer | No | Fee amount (percentage x100 or cents) |
| frequency | string | No | `once`, `monthly`, `weekly` |
| gracePeriodDays | integer | No | Days after due date before fees apply |

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location",
  "enabled": true,
  "feeType": "flat",
  "feeAmount": 2500,
  "frequency": "once",
  "gracePeriodDays": 14
}
```

## Response Example
```json
{
  "template": {
    "_id": "tmpl_abc123",
    "lateFeeConfiguration": {
      "enabled": true,
      "feeType": "flat",
      "feeAmount": 2500,
      "frequency": "once",
      "gracePeriodDays": 14
    }
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing required fields or invalid configuration |
| 401 | Unauthorized — invalid or expired token |
| 404 | Template not found |

## Common Use Cases
Set default late fee rules on a template so all invoices created from it inherit the same penalty structure.

## Gotchas
- `feeAmount` for flat type is in cents (2500 = $25.00).
- `feeAmount` for percentage type is multiplied by 100 (150 = 1.5%).
- Invoices created from this template inherit these settings but can be overridden per-invoice.
