# Delete Price

- **Method:** DELETE
- **Path:** `/products/{productId}/price/{priceId}`
- **Scopes:** `products/prices.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `productId` | string | Yes | The product ID |
| `priceId` | string | Yes | The price ID |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/products/prod_abc123/price/price_xyz789' \
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
| 404 | Not Found — product or price does not exist |
| 422 | Unprocessable Entity — price has active subscriptions |

## Common Use Cases
Remove a pricing tier that is no longer offered.

## Gotchas
- Prices with active subscriptions may not be deletable. Cancel or migrate subscriptions first.
- A product should have at least one price to be purchasable. Deleting all prices makes it unpurchasable.
