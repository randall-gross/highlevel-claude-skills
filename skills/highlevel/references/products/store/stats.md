# Get Store Product Stats

- **Method:** GET
- **Path:** `/products/store/{storeId}/stats`
- **Scopes:** `products.readonly`
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
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/products/store/store_abc123/stats' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "stats": {
    "storeId": "store_abc123",
    "totalProducts": 24,
    "activeProducts": 20,
    "outOfStock": 2,
    "draftProducts": 2,
    "totalRevenue": 1250000,
    "totalOrders": 156
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — store does not exist |

## Common Use Cases
Build a store dashboard showing product counts, stock status, and revenue summaries.

## Gotchas
- `totalRevenue` is in the smallest currency unit (cents for USD). `1250000` = $12,500.00.
- Stats are for the specific store, not the entire location catalog. A location with multiple stores will have separate stats per store.
