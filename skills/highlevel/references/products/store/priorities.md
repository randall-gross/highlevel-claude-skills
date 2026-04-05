# Update Product Display Priorities

- **Method:** POST
- **Path:** `/products/store/{storeId}/priority`
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
| `priorities` | object[] | Yes | Array of product priority objects |
| `priorities[].productId` | string | Yes | The product ID |
| `priorities[].priority` | integer | Yes | Display priority (lower number = higher priority) |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/products/store/store_abc123/priority' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "priorities": [
      { "productId": "prod_abc123", "priority": 1 },
      { "productId": "prod_def456", "priority": 2 },
      { "productId": "prod_ghi789", "priority": 3 }
    ]
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
| 400 | Bad Request — missing required fields or invalid priority values |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — store does not exist |

## Common Use Cases
Control the display order of products on a storefront. Feature top-selling or promoted products first.

## Gotchas
- Lower priority numbers display first (priority 1 appears before priority 2).
- You only need to include products whose priority you want to change. Omitted products keep their current priority.
- Products must be included in the store before setting their priority.
