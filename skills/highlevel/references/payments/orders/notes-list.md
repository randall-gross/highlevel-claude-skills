# List Order Notes

- **Method:** GET
- **Path:** `/payments/orders/{orderId}/notes`
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
curl -X GET "https://services.leadconnectorhq.com/payments/orders/order_abc123/notes?locationId=ve9EPM428h8vShlRW1KT" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example

```json
{
  "notes": [
    {
      "id": "note_001",
      "orderId": "order_abc123",
      "body": "Customer requested gift wrapping",
      "createdBy": "user_abc",
      "createdAt": "2024-01-15T11:00:00Z"
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

Retrieve internal notes attached to an order for customer service or fulfillment context.

## Gotchas

- Returns an empty array if no notes exist, not a 404.
- Notes are internal — they are not visible to the customer.
