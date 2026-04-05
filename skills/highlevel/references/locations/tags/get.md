# Get Tag

- **Method:** GET
- **Path:** `/locations/{locationId}/tags/{tagId}`
- **Scopes:** `locations/tags.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |
| `tagId` | string | Yes | The tag ID |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/tags/tag_abc123' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "tag": {
    "id": "tag_abc123",
    "name": "VIP",
    "locationId": "ve9EPM428h8vShlRW1KT"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid ID format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — tag does not exist |

## Common Use Cases

Look up a specific tag by ID to verify its name or existence before applying it to contacts.

## Gotchas

- Tags have no metadata beyond `id`, `name`, and `locationId`. There is no description, color, or category field.
