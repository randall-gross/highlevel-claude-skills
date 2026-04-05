# Bulk Update Reviews

- **Method:** POST
- **Path:** `/products/reviews/bulk-update`
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
| `ids` | string[] | Yes | Array of review IDs to update |
| `status` | string | Yes | New status: `approved` or `rejected` |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/products/reviews/bulk-update' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "ids": ["rev_abc123", "rev_def456", "rev_ghi789"],
    "status": "approved"
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
| 400 | Bad Request — missing locationId, ids, or status |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — one or more review IDs are invalid |

## Common Use Cases
Approve or reject multiple reviews at once from a moderation queue.

## Gotchas
- The same status is applied to all specified reviews. You cannot approve some and reject others in the same call.
- All review IDs must belong to the specified location.
