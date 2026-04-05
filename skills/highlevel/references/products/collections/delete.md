# Delete Collection

- **Method:** DELETE
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
N/A

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/products/collections/coll_abc123' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
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
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — collection does not exist |

## Common Use Cases
Remove a collection that is no longer needed (e.g., expired seasonal promotion).

## Gotchas
- Deleting a collection does NOT delete the products in it. Products remain in the catalog but are no longer grouped under this collection.
