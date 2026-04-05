# Record Payment

- **Method:** POST
- **Path:** `/payments/orders/{orderId}/record-payment`
- **Scopes:** `payments/orders.collectPayment`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| orderId | string | Yes | Order ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| amount | number | Yes | Payment amount in cents |
| currency | string | No | Currency code (default: USD) |
| paymentMethod | string | No | Payment method description |
| notes | string | No | Payment notes |

## Request Example

```bash
curl -X POST "https://services.leadconnectorhq.com/payments/orders/order_abc123/record-payment" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28" \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "amount": 9999,
    "currency": "USD",
    "paymentMethod": "cash",
    "notes": "Paid in person"
  }'
```

## Response Example

```json
{
  "success": true,
  "payment": {
    "id": "payment_001",
    "orderId": "order_abc123",
    "amount": 9999,
    "currency": "USD",
    "paymentMethod": "cash",
    "createdAt": "2024-01-15T12:00:00Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing required fields or invalid amount |
| 401 | Unauthorized — invalid or expired token |
| 404 | Order not found |
| 422 | Unprocessable Entity |

## Common Use Cases

Record manual or offline payments (cash, check, wire transfer) against an existing order.

## Gotchas

- Requires the `payments/orders.collectPayment` scope, not `payments/orders.write`.
- Amount is in cents (9999 = $99.99).
- Recording a payment may automatically update order status to "completed" if the full amount is covered.
