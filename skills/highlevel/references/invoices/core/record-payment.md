# Record Payment

- **Method:** POST
- **Path:** `/invoices/{invoiceId}/record-payment`
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
| amount | integer | Yes | Payment amount in cents |
| mode | string | Yes | Payment method (cash, check, bank_transfer, other) |
| notes | string | No | Payment notes |

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location",
  "amount": 15000,
  "mode": "cash",
  "notes": "Paid in person at office"
}
```

## Response Example
```json
{
  "invoice": {
    "_id": "inv_abc123",
    "status": "paid",
    "amountPaid": 15000,
    "amountDue": 0,
    "total": 15000,
    "payments": [
      {
        "amount": 15000,
        "mode": "cash",
        "notes": "Paid in person at office",
        "recordedAt": "2026-04-04T12:00:00.000Z"
      }
    ]
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing required fields or invalid amount |
| 401 | Unauthorized — invalid or expired token |
| 404 | Invoice not found |
| 422 | Payment exceeds amount due or invoice is void |

## Common Use Cases
Record an offline/manual payment for an invoice, such as cash or check payments received outside the payment gateway.

## Gotchas
- `amount` is in cents (15000 = $150.00).
- Recording a payment equal to `amountDue` transitions the invoice to `paid` status.
- Partial payments transition to `partially_paid` status.
- Cannot record payments on voided invoices.
