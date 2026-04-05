# List Prices

- **Method:** GET
- **Path:** `/products/{productId}/price`
- **Scopes:** `products/prices.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `productId` | string | Yes | The product ID |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/products/prod_abc123/price' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "prices": [
    {
      "id": "price_xyz789",
      "productId": "prod_abc123",
      "name": "Monthly",
      "type": "recurring",
      "amount": 29900,
      "currency": "USD",
      "recurring": {
        "interval": "month",
        "intervalCount": 1
      },
      "createdAt": "2024-03-01T12:00:00.000Z"
    },
    {
      "id": "price_one456",
      "productId": "prod_abc123",
      "name": "One-Time Purchase",
      "type": "one_time",
      "amount": 299900,
      "currency": "USD",
      "recurring": null,
      "createdAt": "2024-03-01T12:00:00.000Z"
    }
  ]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — product does not exist |

## Common Use Cases
Retrieve all pricing options for a product to display in a storefront or pricing table.

## Gotchas
- Amounts are in the smallest currency unit (cents for USD). `29900` = $299.00.
- A product can have both one-time and recurring prices simultaneously.
