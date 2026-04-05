# List Coupons

- **Method:** GET
- **Path:** `/payments/coupon/list`
- **Scopes:** `payments/coupons.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |

## Request Example

```bash
curl -X GET "https://services.leadconnectorhq.com/payments/coupon/list?locationId=ve9EPM428h8vShlRW1KT" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example

```json
{
  "coupons": [
    {
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
  ]
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing or invalid locationId |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity |

## Common Use Cases

Retrieve all coupons for a location to display in a management dashboard or validate coupon availability.

## Gotchas

- The path uses `/coupon/list` (singular "coupon"), not `/coupons/list`.
