# Get Order

- **Method:** GET
- **Path:** `/payments/orders/{orderId}`
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
curl -X GET "https://services.leadconnectorhq.com/payments/orders/order_abc123?locationId=ve9EPM428h8vShlRW1KT" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example

```json
{
  "order": {
    "id": "order_abc123",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "contactId": "contact_xyz789",
    "status": "completed",
    "amount": 9999,
    "currency": "USD",
    "items": [
      {
        "name": "Premium Plan",
        "amount": 9999,
        "quantity": 1
      }
    ],
    "fulfillments": [],
    "notes": [],
    "createdAt": "2024-01-15T10:00:00Z",
    "updatedAt": "2024-01-15T10:05:00Z"
  }
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

Retrieve full order details including items, fulfillments, and notes for an order detail page.

## Gotchas

- The `locationId` is still required as a query parameter even though `orderId` is in the path.
- Amounts are in cents.
