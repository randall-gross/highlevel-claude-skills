# Update Inventory

- **Method:** POST
- **Path:** `/products/inventory`
- **Scopes:** `products.write`
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
| `productId` | string | Yes | The product ID |
| `variantId` | string | No | The variant ID (if product has variants) |
| `quantity` | integer | Yes | New inventory quantity |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/products/inventory' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "productId": "prod_abc123",
    "variantId": "var_001",
    "quantity": 200
  }'
```

## Response Example

```json
{
  "inventory": {
    "productId": "prod_abc123",
    "variantId": "var_001",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "quantity": 200,
    "reserved": 5,
    "available": 195,
    "updatedAt": "2024-03-20T14:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — product or variant does not exist |

## Common Use Cases
Restock products after receiving shipments, or adjust inventory levels after manual counts.

## Gotchas
- This sets the absolute quantity, not a delta. To add 50 units, you must read current inventory first and set the new total.
- Reserved quantities are not affected by this update. `available` is recalculated automatically.
- If the product has variants, you must specify `variantId`. Without it, the update applies to the default/base product.
