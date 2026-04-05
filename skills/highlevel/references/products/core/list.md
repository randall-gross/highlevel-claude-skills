# List Products

- **Method:** GET
- **Path:** `/products/`
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
| `limit` | integer | No | Number of results per page (default 20, max 100) |
| `offset` | integer | No | Number of results to skip for pagination |
| `search` | string | No | Search by product name |
| `storeId` | string | No | Filter products by store ID |

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/products/?locationId=ve9EPM428h8vShlRW1KT&limit=20&offset=0&search=premium' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "products": [
    {
      "id": "prod_abc123",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "name": "Premium Coaching Package",
      "description": "12-week coaching program",
      "productType": "DIGITAL",
      "imageUrls": ["https://example.com/image.jpg"],
      "statementDescriptor": "PREMIUM COACHING",
      "createdAt": "2024-03-01T12:00:00.000Z",
      "updatedAt": "2024-03-01T12:00:00.000Z"
    }
  ],
  "total": 45
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId parameter |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Build paginated product catalogs, search for products by name, or filter by store.

## Gotchas
- This uses offset-based pagination, not cursor-based. Pass `offset` to paginate.
- The `search` param only matches product name. For filtering by type or other fields, filter client-side.
