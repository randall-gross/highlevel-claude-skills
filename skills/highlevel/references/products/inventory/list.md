# List Inventory

- **Method:** GET
- **Path:** `/products/inventory`
- **Scopes:** `products.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `productId` | string | No | Filter inventory by product ID |

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/products/inventory?locationId=ve9EPM428h8vShlRW1KT&productId=prod_abc123' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "inventory": [
    {
      "productId": "prod_abc123",
      "variantId": "var_001",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "quantity": 150,
      "reserved": 5,
      "available": 145,
      "updatedAt": "2024-03-15T10:00:00.000Z"
    }
  ]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId parameter |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Check current stock levels for products, build low-stock alerts, or display availability on storefront.

## Gotchas
- `available` = `quantity` - `reserved`. Reserved units are held for pending orders.
- Inventory tracking is opt-in. Products without inventory tracking enabled will not appear in results.
- For digital products, inventory tracking is typically not used.
