# Bulk Update Products

- **Method:** POST
- **Path:** `/products/bulk-update`
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
| `ids` | string[] | Yes | Array of product IDs to update |
| `update` | object | Yes | Fields to update on all specified products |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/products/bulk-update' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "ids": ["prod_abc123", "prod_def456", "prod_ghi789"],
    "update": {
      "productType": "DIGITAL"
    }
  }'
```

## Response Example

```json
{
  "succeeded": true,
  "updatedCount": 3
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId, ids, or update fields |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — one or more product IDs are invalid |

## Common Use Cases
Batch update product types, descriptions, or other shared attributes across multiple products at once.

## Gotchas
- The same update is applied to all specified products. You cannot set different values per product — use bulk-edit for that.
- If any product ID is invalid, the entire operation may fail depending on the API's error handling mode.
