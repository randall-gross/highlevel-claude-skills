# Delete Review

- **Method:** DELETE
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
N/A

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/products/reviews/rev_abc123' \
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
| 404 | Not Found — review does not exist |

## Common Use Cases
Remove spam or inappropriate reviews that should not remain in the system even as rejected.

## Gotchas
- This is a hard delete. The review cannot be recovered.
- For moderation purposes, prefer rejecting a review over deleting it so you maintain a record.
