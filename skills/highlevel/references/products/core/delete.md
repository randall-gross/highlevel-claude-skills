# Delete Product

- **Method:** DELETE
- **Path:** `/products/{productId}`
- **Scopes:** `products.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `productId` | string | Yes | The product ID |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/products/prod_abc123' \
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
| 404 | Not Found — product does not exist |
| 422 | Unprocessable Entity — product has active subscriptions or orders |

## Common Use Cases
Remove a product from the catalog when it is no longer offered.

## Gotchas
- Deleting a product also deletes all associated prices.
- Products with active subscriptions or pending orders may not be deletable. Cancel subscriptions first.
- This is a hard delete — the product cannot be recovered.
