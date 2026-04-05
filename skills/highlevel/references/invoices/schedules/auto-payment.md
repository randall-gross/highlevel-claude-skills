# Manage Auto-Payment

- **Method:** POST
- **Path:** `/invoices/schedule/{scheduleId}/auto-payment`
- **Scopes:** `invoices/schedule.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| scheduleId | string | Yes | Schedule ID |

### Body Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |
| enabled | boolean | Yes | Enable/disable auto-payment |
| paymentMethodId | string | No | Saved payment method ID (required if enabling) |

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location",
  "enabled": true,
  "paymentMethodId": "pm_xyz789"
}
```

## Response Example
```json
{
  "schedule": {
    "_id": "sched_abc123",
    "autoPayment": {
      "enabled": true,
      "paymentMethodId": "pm_xyz789"
    }
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 404 | Schedule or payment method not found |
| 422 | Payment method invalid or expired |

## Common Use Cases
Enable automatic payment collection on a recurring schedule so invoices are charged immediately upon generation.

## Gotchas
- The contact must have a saved payment method on file. Use the payments API to manage saved methods.
- Auto-payment only works with credit card and ACH payment methods.
- If auto-payment fails, the invoice is still generated but remains in `sent` status.
