# Validate Calendar Group Slug

- **Method:** POST
- **Path:** `/calendars/groups/validate-slug`
- **Scopes:** `calendars/groups.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| slug | string | Yes | Slug to validate |

## Request Example

```bash
curl --request POST \
  --url 'https://services.leadconnectorhq.com/calendars/groups/validate-slug' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "slug": "sales-calendars"
  }'
```

## Response Example

```json
{
  "available": true
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity |

## Common Use Cases

Check if a desired slug is available before creating or updating a calendar group, to avoid 422 errors.

## Gotchas

- Slugs are scoped to the location — the same slug can exist in different locations.
- Slug format should be lowercase, hyphenated (e.g., `my-calendar-group`).
- This is a POST, not a GET, even though it is a read-only check.
