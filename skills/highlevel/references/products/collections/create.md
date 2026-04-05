# Create Collection

- **Method:** POST
- **Path:** `/products/collections`
- **Scopes:** `products/collection.write`
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
| `name` | string | Yes | Collection name |
| `description` | string | No | Collection description |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/products/collections' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Seasonal Specials",
    "description": "Limited-time seasonal product offerings"
  }'
```

## Response Example

```json
{
  "collection": {
    "id": "coll_ghi789",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Seasonal Specials",
    "description": "Limited-time seasonal product offerings",
    "createdAt": "2024-03-20T10:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId or name |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Create a new collection to organize products by category, season, or promotion.

## Gotchas
- Creating a collection does not add any products to it. You manage product-collection associations separately.
