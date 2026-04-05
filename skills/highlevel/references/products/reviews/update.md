# Update Review

- **Method:** PUT
- **Path:** `/products/reviews/{reviewId}`
- **Scopes:** `products.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `reviewId` | string | Yes | The review ID |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `status` | string | Yes | New review status: `approved` or `rejected` |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/products/reviews/rev_abc123' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "status": "approved"
  }'
```

## Response Example

```json
{
  "review": {
    "id": "rev_abc123",
    "productId": "prod_abc123",
    "status": "approved",
    "updatedAt": "2024-03-20T14:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid status value |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — review does not exist |

## Common Use Cases
Approve or reject a pending product review as part of a moderation workflow.

## Gotchas
- Only `approved` and `rejected` are valid status values. You cannot set a review back to `pending`.
- Approved reviews become publicly visible on the storefront immediately.
