# List Fulfillments

- **Method:** GET
- **Path:** `/payments/orders/{orderId}/fulfillments`
- **Scopes:** `payments/orders.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| orderId | string | Yes | Order ID |

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |

## Request Example

```bash
curl -X GET "https://services.leadconnectorhq.com/payments/orders/order_abc123/fulfillments?locationId=ve9EPM428h8vShlRW1KT" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example

```json
{
  "fulfillments": [
    {
      "id": "fulfillment_001",
      "orderId": "order_abc123",
      "status": "fulfilled",
      "trackingNumber": "1Z999AA10123456784",
      "trackingUrl": "https://tracking.example.com/1Z999AA10123456784",
      "items": [
        {
          "name": "Premium Plan",
          "quantity": 1
        }
      ],
      "createdAt": "2024-01-16T08:00:00Z"
    }
  ]
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing or invalid parameters |
| 401 | Unauthorized — invalid or expired token |
| 404 | Order not found |
| 422 | Unprocessable Entity |

## Common Use Cases

Check fulfillment/shipping status for physical product orders.

## Gotchas

- Returns an empty array if no fulfillments exist yet, not a 404.
