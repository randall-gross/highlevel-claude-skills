# Get Review Count

- **Method:** GET
- **Path:** `/products/reviews/count`
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
| `productId` | string | No | Filter counts by product ID |

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/products/reviews/count?locationId=ve9EPM428h8vShlRW1KT' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "counts": {
    "pending": 5,
    "approved": 42,
    "rejected": 3,
    "total": 50
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId parameter |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Display review count badges in a dashboard or show the number of pending reviews needing moderation.

## Gotchas
- Counts are broken down by status. Use this to show moderation queue sizes without fetching all reviews.
