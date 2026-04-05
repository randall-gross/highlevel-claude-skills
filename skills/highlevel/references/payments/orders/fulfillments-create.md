# Create Fulfillment

- **Method:** POST
- **Path:** `/payments/orders/{orderId}/fulfillments`
- **Scopes:** `payments/orders.write`
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
| trackingNumber | string | No | Shipping tracking number |
| trackingUrl | string | No | Tracking URL |
| items | object[] | No | Items being fulfilled |
| notifyCustomer | boolean | No | Send notification to customer |

## Request Example

```bash
curl -X POST "https://services.leadconnectorhq.com/payments/orders/order_abc123/fulfillments" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28" \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "trackingNumber": "1Z999AA10123456784",
    "trackingUrl": "https://tracking.example.com/1Z999AA10123456784",
    "notifyCustomer": true
  }'
```

## Response Example

```json
{
  "fulfillment": {
    "id": "fulfillment_001",
    "orderId": "order_abc123",
    "status": "fulfilled",
    "trackingNumber": "1Z999AA10123456784",
    "trackingUrl": "https://tracking.example.com/1Z999AA10123456784",
    "createdAt": "2024-01-16T08:00:00Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing required fields or invalid values |
| 401 | Unauthorized — invalid or expired token |
| 404 | Order not found |
| 422 | Unprocessable Entity |

## Common Use Cases

Mark an order as fulfilled/shipped and optionally notify the customer with tracking info.

## Gotchas

- Creating a fulfillment may automatically update the order status.
- The `notifyCustomer` flag triggers an email/SMS to the contact on the order.
