# Search Locations

- **Method:** GET
- **Path:** `/locations/search`
- **Scopes:** `locations.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `companyId` | string | Yes | Agency company ID to search within |
| `email` | string | No | Filter by email address |
| `limit` | integer | No | Number of results per page (default: 25) |
| `order` | string | No | Sort order: `asc` or `desc` |
| `skip` | integer | No | Number of results to skip for pagination |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/locations/search?companyId=5DP4iH6HLkQsiKESj6rh&limit=10&skip=0&order=asc' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "locations": [
    {
      "id": "ve9EPM428h8vShlRW1KT",
      "companyId": "5DP4iH6HLkQsiKESj6rh",
      "name": "My Business",
      "address": "123 Main St",
      "city": "Dallas",
      "state": "TX",
      "country": "US",
      "postalCode": "75001",
      "email": "john@mybusiness.com",
      "phone": "+15551234567"
    }
  ],
  "count": 1,
  "total": 1
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing companyId |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — invalid query parameters |

## Common Use Cases

List all sub-accounts under an agency, or find a specific location by email. Used for agency dashboards and location picker UIs.

## Gotchas

- `companyId` is **required**. This is the agency-level company ID, not a location ID.
- Pagination uses `skip`/`limit` (not cursor-based). The `total` field in the response gives the full count.
- The `email` filter matches the location's primary email, not contact emails within the location.
