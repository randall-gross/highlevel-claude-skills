# List Orders

- **Method:** GET
- **Path:** `/payments/orders`
- **Scopes:** `payments/orders.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| status | string | No | Filter by order status |
| contactId | string | No | Filter by contact ID |
| search | string | No | Search term |
| limit | number | No | Number of results per page |
| offset | number | No | Pagination offset |

## Request Example

```bash
curl -X GET "https://services.leadconnectorhq.com/payments/orders?locationId=ve9EPM428h8vShlRW1KT&limit=20&offset=0" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example

```json
{
  "orders": [
    {
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
      "createdAt": "2024-01-15T10:00:00Z",
      "updatedAt": "2024-01-15T10:05:00Z"
    }
  ],
  "total": 150,
  "limit": 20,
  "offset": 0
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing or invalid parameters |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity |

## Common Use Cases

Display a paginated list of orders in a dashboard, or filter orders by contact to show purchase history.

## Gotchas

- Uses `limit`/`offset` pagination, not cursor-based.
- Amounts are in cents (9999 = $99.99).
