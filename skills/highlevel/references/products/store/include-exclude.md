# Include/Exclude Product in Store

- **Method:** POST
- **Path:** `/products/store/{storeId}`
- **Scopes:** `products.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `storeId` | string | Yes | The store ID |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `productId` | string | Yes | The product ID to include or exclude |
| `action` | string | Yes | Action: `include` or `exclude` |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/products/store/store_abc123' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "productId": "prod_abc123",
    "action": "include"
  }'
```

## Response Example

```json
{
  "succeeded": true
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing required fields or invalid action |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — store or product does not exist |

## Common Use Cases
Control which products are visible in a specific store. Useful for multi-store setups where different stores carry different product lines.

## Gotchas
- A product must exist in the catalog before it can be included in a store.
- Excluding a product hides it from the storefront but does not delete it from the catalog.
- This is a per-store operation. A product can be included in one store and excluded from another.
