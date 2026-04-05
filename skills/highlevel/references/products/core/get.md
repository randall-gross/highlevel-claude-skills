# Get Product

- **Method:** GET
- **Path:** `/products/{productId}`
- **Scopes:** `products.readonly`
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
  'https://services.leadconnectorhq.com/products/prod_abc123' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "product": {
    "id": "prod_abc123",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Premium Coaching Package",
    "description": "12-week coaching program with weekly 1-on-1 sessions",
    "productType": "DIGITAL",
    "imageUrls": ["https://example.com/image1.jpg", "https://example.com/image2.jpg"],
    "statementDescriptor": "PREMIUM COACHING",
    "prices": [
      {
        "id": "price_xyz789",
        "name": "Monthly",
        "type": "recurring",
        "amount": 29900,
        "currency": "USD",
        "recurring": {
          "interval": "month",
          "intervalCount": 1
        }
      }
    ],
    "createdAt": "2024-03-01T12:00:00.000Z",
    "updatedAt": "2024-03-15T08:30:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — product does not exist or belongs to a different location |

## Common Use Cases
Retrieve full product details including all associated prices for display or editing.

## Gotchas
- The get endpoint returns the full product record including nested prices. The list endpoint may return a subset of fields.
- Amounts are in the smallest currency unit (cents for USD). `29900` = $299.00.
