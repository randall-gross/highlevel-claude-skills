# Get Price

- **Method:** GET
- **Path:** `/products/{productId}/price/{priceId}`
- **Scopes:** `products/prices.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `productId` | string | Yes | The product ID |
| `priceId` | string | Yes | The price ID |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/products/prod_abc123/price/price_xyz789' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "price": {
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
    "createdAt": "2024-03-01T12:00:00.000Z",
    "updatedAt": "2024-03-01T12:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — product or price does not exist |

## Common Use Cases
Retrieve details for a specific price, e.g., to confirm amount before processing a payment.

## Gotchas
- Both `productId` and `priceId` must be valid and the price must belong to the specified product.
