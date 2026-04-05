# List Collections

- **Method:** GET
- **Path:** `/products/collections`
- **Scopes:** `products/collection.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/products/collections?locationId=ve9EPM428h8vShlRW1KT' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "collections": [
    {
      "id": "coll_abc123",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "name": "Featured Products",
      "description": "Hand-picked products for the homepage",
      "productCount": 8,
      "createdAt": "2024-03-01T12:00:00.000Z"
    },
    {
      "id": "coll_def456",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "name": "Coaching Programs",
      "description": "All coaching and mentorship products",
      "productCount": 3,
      "createdAt": "2024-03-05T09:00:00.000Z"
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
Retrieve all product collections for a location to build storefront navigation or category pages.

## Gotchas
- Collections are location-scoped. You must provide `locationId`.
