# Get Sub-Account

- **Method:** GET
- **Path:** `/locations/{locationId}`
- **Scopes:** `locations.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "location": {
    "id": "ve9EPM428h8vShlRW1KT",
    "companyId": "5DP4iH6HLkQsiKESj6rh",
    "name": "My Business",
    "address": "123 Main St",
    "city": "Dallas",
    "state": "TX",
    "country": "US",
    "postalCode": "75001",
    "website": "https://mybusiness.com",
    "timezone": "America/Chicago",
    "firstName": "John",
    "lastName": "Doe",
    "email": "john@mybusiness.com",
    "phone": "+15551234567",
    "settings": {
      "allowDuplicateContact": false,
      "allowDuplicateOpportunity": false,
      "allowFacebookNameMerge": false
    },
    "social": {
      "facebookUrl": "",
      "googlePlus": "",
      "linkedIn": "",
      "foursquare": "",
      "twitter": "",
      "yelp": "",
      "instagram": "",
      "youtube": "",
      "pinterest": "",
      "blogRss": "",
      "googlePlacesId": ""
    }
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid locationId format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — location does not exist |
| 422 | Unprocessable Entity — validation error |

## Common Use Cases

Retrieve full details of a sub-account including address, settings, and social links. Used to verify location configuration or display account info in a dashboard.

## Gotchas

- The `settings` object contains important flags like `allowDuplicateContact` that affect contact creation behavior across the entire location.
- Social fields return empty strings (not null) when not set.
