# Update Sub-Account

- **Method:** PUT
- **Path:** `/locations/{locationId}`
- **Scopes:** `locations.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `name` | string | No | Business name |
| `address` | string | No | Street address |
| `city` | string | No | City |
| `state` | string | No | State |
| `country` | string | No | Country (2-letter ISO code) |
| `postalCode` | string | No | Postal/ZIP code |
| `website` | string | No | Business website URL |
| `timezone` | string | No | IANA timezone |
| `firstName` | string | No | Primary contact first name |
| `lastName` | string | No | Primary contact last name |
| `email` | string | No | Primary contact email |
| `phone` | string | No | Primary contact phone |
| `settings` | object | No | Location settings |
| `social` | object | No | Social media URLs |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "name": "Updated Business Name",
    "city": "Austin",
    "state": "TX",
    "website": "https://updatedbusiness.com"
  }'
```

## Response Example

```json
{
  "location": {
    "id": "ve9EPM428h8vShlRW1KT",
    "companyId": "5DP4iH6HLkQsiKESj6rh",
    "name": "Updated Business Name",
    "address": "123 Main St",
    "city": "Austin",
    "state": "TX",
    "country": "US",
    "postalCode": "75001",
    "website": "https://updatedbusiness.com",
    "timezone": "America/Chicago"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid parameters |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — location does not exist |
| 422 | Unprocessable Entity — validation error |

## Common Use Cases

Update location details such as name, address, or settings after initial setup. Used for syncing business info changes from an external system.

## Gotchas

- Partial updates are supported; only include fields you want to change.
- Updating `settings` replaces the entire settings object, not individual fields within it. Send the full settings object if you only want to change one setting.
