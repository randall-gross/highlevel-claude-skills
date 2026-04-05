# Migrate Order Payment Status

- **Method:** POST
- **Path:** `/payments/orders/migrate-order-ps`
- **Scopes:** `payments/orders.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| orderId | string | Yes | Order ID to migrate |
| paymentStatus | string | Yes | New payment status |

## Request Example

```bash
curl -X POST "https://services.leadconnectorhq.com/payments/orders/migrate-order-ps" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28" \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "orderId": "order_abc123",
    "paymentStatus": "paid"
  }'
```

## Response Example

```json
{
  "success": true,
  "order": {
    "id": "order_abc123",
    "paymentStatus": "paid",
    "updatedAt": "2024-01-15T14:00:00Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing required fields or invalid status |
| 401 | Unauthorized — invalid or expired token |
| 404 | Order not found |
| 422 | Unprocessable Entity |

## Common Use Cases

Bulk-migrate order payment statuses when transitioning between payment systems or correcting payment records.

## Gotchas

- The endpoint path is `/migrate-order-ps` (ps = payment status), not `/migrate-order`.
- This is an administrative action — use carefully as it directly overrides the payment status without processing an actual payment.
