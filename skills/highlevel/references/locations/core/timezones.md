# Fetch Available Timezones

- **Method:** GET
- **Path:** `/locations/{locationId}/timezones`
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
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/timezones' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "timezones": [
    "US/Eastern",
    "US/Central",
    "US/Mountain",
    "US/Pacific",
    "US/Alaska",
    "US/Hawaii",
    "America/New_York",
    "America/Chicago",
    "America/Denver",
    "America/Los_Angeles",
    "America/Phoenix",
    "Europe/London",
    "Europe/Paris",
    "Asia/Tokyo",
    "Australia/Sydney"
  ]
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid locationId |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — location does not exist |

## Common Use Cases

Fetch the list of valid timezones before creating or updating a location. Used to populate timezone dropdowns in settings UIs.

## Gotchas

- The returned list contains IANA timezone identifiers. Use these exact strings when setting a location's timezone.
- The list is scoped to the location but is generally the same across all locations. Cache the result if calling frequently.
