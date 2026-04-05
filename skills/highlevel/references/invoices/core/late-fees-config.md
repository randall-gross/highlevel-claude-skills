# Update Late Fees Configuration

- **Method:** PATCH
- **Path:** `/invoices/{invoiceId}/late-fees-configuration`
- **Scopes:** `invoices.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| invoiceId | string | Yes | Invoice ID |

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
  "feeType": "percentage",
  "feeAmount": 150,
  "frequency": "monthly",
  "gracePeriodDays": 7
}
```

## Response Example
```json
{
  "invoice": {
    "_id": "inv_abc123",
    "lateFeeConfiguration": {
      "enabled": true,
      "feeType": "percentage",
      "feeAmount": 150,
      "frequency": "monthly",
      "gracePeriodDays": 7
    }
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing required fields or invalid configuration |
| 401 | Unauthorized — invalid or expired token |
| 404 | Invoice not found |

## Common Use Cases
Configure automatic late fee charges for overdue invoices, such as a 1.5% monthly penalty after a 7-day grace period.

## Gotchas
- `feeAmount` for percentage type is multiplied by 100 (150 = 1.5%).
- `feeAmount` for flat type is in cents (500 = $5.00).
- Late fees only apply to sent invoices that are past due date + grace period.
