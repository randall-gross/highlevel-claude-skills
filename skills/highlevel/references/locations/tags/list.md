# List All Tags

- **Method:** GET
- **Path:** `/locations/{locationId}/tags`
- **Scopes:** `locations/tags.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/tags' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "tags": [
    {
      "id": "tag_abc123",
      "name": "VIP",
      "locationId": "ve9EPM428h8vShlRW1KT"
    },
    {
      "id": "tag_def456",
      "name": "Lead",
      "locationId": "ve9EPM428h8vShlRW1KT"
    },
    {
      "id": "tag_ghi789",
      "name": "Past Customer",
      "locationId": "ve9EPM428h8vShlRW1KT"
    }
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

Retrieve all tags in a location to populate tag selectors or to map tag IDs for bulk operations.

## Gotchas

- Returns all tags with no pagination. Locations with many tags return the full list in one response.
- Tag names are case-sensitive. "VIP" and "vip" are different tags.
