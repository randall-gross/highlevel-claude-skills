# List Reviews

- **Method:** GET
- **Path:** `/products/reviews`
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
| `productId` | string | No | Filter reviews by product ID |
| `status` | string | No | Filter by review status: `pending`, `approved`, `rejected` |
| `limit` | integer | No | Number of results per page (default 20, max 100) |
| `offset` | integer | No | Number of results to skip for pagination |

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/products/reviews?locationId=ve9EPM428h8vShlRW1KT&status=pending&limit=20' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "reviews": [
    {
      "id": "rev_abc123",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "productId": "prod_abc123",
      "rating": 5,
      "title": "Excellent program",
      "body": "The coaching sessions were incredibly helpful.",
      "author": "Jane Smith",
      "status": "pending",
      "createdAt": "2024-03-15T10:00:00.000Z"
    }
  ],
  "total": 12
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId parameter |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Build a review moderation queue by listing pending reviews, or display approved reviews on a product page.

## Gotchas
- Reviews default to `pending` status and must be approved before they are publicly visible.
- Use the `status` filter to build moderation workflows (pending reviews needing action).
