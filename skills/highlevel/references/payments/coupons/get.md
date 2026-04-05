# Get Coupon

- **Method:** GET
- **Path:** `/payments/coupon`
- **Scopes:** `payments/coupons.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| couponId | string | Yes | Coupon ID to retrieve |

## Request Example

```bash
curl -X GET "https://services.leadconnectorhq.com/payments/coupon?locationId=ve9EPM428h8vShlRW1KT&couponId=coupon_abc123" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example

```json
{
  "coupon": {
    "id": "coupon_abc123",
    "name": "Summer Sale",
    "code": "SUMMER20",
    "type": "percentage",
    "value": 20,
    "duration": "once",
    "productIds": ["prod_123"],
    "locationId": "ve9EPM428h8vShlRW1KT",
    "createdAt": "2024-01-15T10:00:00Z",
    "updatedAt": "2024-01-15T10:00:00Z"
  }
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

Fetch a specific coupon's details for display or validation before applying to an order.

## Gotchas

- Both `locationId` and `couponId` are query parameters, not path parameters.
