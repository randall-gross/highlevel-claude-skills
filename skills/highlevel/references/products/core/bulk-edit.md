# Bulk Edit Products and Prices

- **Method:** POST
- **Path:** `/products/bulk-update/edit`
- **Scopes:** `products.write`, `products/prices.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `products` | object[] | Yes | Array of product objects with individual updates |
| `products[].id` | string | Yes | Product ID to update |
| `products[].name` | string | No | Updated product name |
| `products[].description` | string | No | Updated product description |
| `products[].prices` | object[] | No | Array of price updates for this product |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/products/bulk-update/edit' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "products": [
      {
        "id": "prod_abc123",
        "name": "Updated Coaching Package",
        "prices": [
          {
            "id": "price_xyz789",
            "amount": 34900
          }
        ]
      },
      {
        "id": "prod_def456",
        "description": "New description for this product"
      }
    ]
  }'
```

## Response Example

```json
{
  "succeeded": true,
  "updatedCount": 2
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId or products array |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — invalid product or price IDs |

## Common Use Cases
Update multiple products with different values in a single request. Useful for bulk price adjustments or catalog-wide edits.

## Gotchas
- Unlike `bulk-update`, this endpoint allows different updates per product.
- Requires both `products.write` and `products/prices.write` scopes if updating prices.
- Price amounts are in the smallest currency unit (cents for USD).
