# Update Collection

- **Method:** PUT
- **Path:** `/products/collections/{collectionId}`
- **Scopes:** `products/collection.write`
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
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | string | No | Updated collection name |
| `description` | string | No | Updated collection description |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/products/collections/coll_abc123' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "name": "Premium Collection",
    "description": "Our top-tier products and services"
  }'
```

## Response Example

```json
{
  "collection": {
    "id": "coll_abc123",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Premium Collection",
    "description": "Our top-tier products and services",
    "updatedAt": "2024-03-20T14:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid field format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — collection does not exist |

## Common Use Cases
Rename or update the description of an existing collection.

## Gotchas
- Only pass the fields you want to change. Omitted fields remain unchanged.
