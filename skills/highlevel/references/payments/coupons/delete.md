# Delete Coupon

- **Method:** DELETE
- **Path:** `/payments/coupon`
- **Scopes:** `payments/coupons.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| couponId | string | Yes | Coupon ID to delete |

## Request Example

```bash
curl -X DELETE "https://services.leadconnectorhq.com/payments/coupon?locationId=ve9EPM428h8vShlRW1KT&couponId=coupon_abc123" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example

```json
{
  "success": true
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing or invalid parameters |
| 401 | Unauthorized — invalid or expired token |
| 404 | Coupon not found |
| 422 | Unprocessable Entity |

## Common Use Cases

Remove expired or cancelled promotional coupons from a location.

## Gotchas

- Deleting a coupon does not retroactively affect orders that already used it.
- Both `locationId` and `couponId` are query parameters on DELETE, not body parameters.
