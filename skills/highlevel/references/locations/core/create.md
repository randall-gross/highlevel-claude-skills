# Create Sub-Account

- **Method:** POST
- **Path:** `/locations/`
- **Scopes:** `locations.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `companyId` | string | Yes | Agency company ID |
| `name` | string | Yes | Business name |
| `address` | string | No | Street address |
| `city` | string | No | City |
| `state` | string | No | State |
| `country` | string | No | Country (2-letter ISO code) |
| `postalCode` | string | No | Postal/ZIP code |
| `website` | string | No | Business website URL |
| `timezone` | string | No | IANA timezone (e.g., `America/Chicago`) |
| `firstName` | string | No | Primary contact first name |
| `lastName` | string | No | Primary contact last name |
| `email` | string | No | Primary contact email |
| `phone` | string | No | Primary contact phone |
| `settings` | object | No | Location settings |
| `settings.allowDuplicateContact` | boolean | No | Allow duplicate contacts |
| `settings.allowDuplicateOpportunity` | boolean | No | Allow duplicate opportunities |
| `settings.allowFacebookNameMerge` | boolean | No | Allow Facebook name merge |
| `social` | object | No | Social media URLs |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/locations/' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "companyId": "5DP4iH6HLkQsiKESj6rh",
    "name": "New Business Location",
    "address": "456 Oak Ave",
    "city": "Houston",
    "state": "TX",
    "country": "US",
    "postalCode": "77001",
    "timezone": "America/Chicago",
    "email": "info@newbusiness.com",
    "phone": "+15559876543"
  }'
```

## Response Example

```json
{
  "location": {
    "id": "newLocationId123",
    "companyId": "5DP4iH6HLkQsiKESj6rh",
    "name": "New Business Location",
    "address": "456 Oak Ave",
    "city": "Houston",
    "state": "TX",
    "country": "US",
    "postalCode": "77001",
    "timezone": "America/Chicago",
    "email": "info@newbusiness.com",
    "phone": "+15559876543"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — validation error (e.g., invalid timezone) |

## Common Use Cases

Programmatically provision new sub-accounts for client onboarding. Typically called from an agency-level integration during white-label setup.

## Gotchas

- This is an **agency-level** endpoint. Requires a token with agency-level access, not a sub-account token.
- `companyId` is the agency's company ID, not the new location's ID.
- The trailing slash on `/locations/` is required.
- Timezone must be a valid IANA timezone string; use the timezones endpoint to get available values.
