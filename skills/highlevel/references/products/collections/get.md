# Get Collection

- **Method:** GET
- **Path:** `/products/collections/{collectionId}`
- **Scopes:** `products/collection.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `collectionId` | string | Yes | The collection ID |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/products/collections/coll_abc123' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "collection": {
    "id": "coll_abc123",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Featured Products",
    "description": "Hand-picked products for the homepage",
    "products": [
      {
        "id": "prod_abc123",
        "name": "Premium Coaching Package"
      },
      {
        "id": "prod_def456",
        "name": "Digital Course Bundle"
      }
    ],
    "createdAt": "2024-03-01T12:00:00.000Z",
    "updatedAt": "2024-03-10T16:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — collection does not exist |

## Common Use Cases
Retrieve a collection with its associated products to render a category page or featured section.

## Gotchas
- The get endpoint may return associated products that the list endpoint does not include.
