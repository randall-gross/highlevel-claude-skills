# Update Tag

- **Method:** PUT
- **Path:** `/locations/{locationId}/tags/{tagId}`
- **Scopes:** `locations/tags.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |
| `tagId` | string | Yes | The tag ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `name` | string | Yes | New tag name |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/tags/tag_new123' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "name": "Warm Lead"
  }'
```

## Response Example

```json
{
  "tag": {
    "id": "tag_new123",
    "name": "Warm Lead",
    "locationId": "ve9EPM428h8vShlRW1KT"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing name |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — tag does not exist |
| 422 | Unprocessable Entity — duplicate tag name |

## Common Use Cases

Rename a tag. The tag ID remains the same, so all contacts with this tag retain it under the new name.

## Gotchas

- Renaming a tag updates it everywhere instantly. All contacts tagged with the old name will show the new name.
- Workflows that trigger on tag name (not ID) will need to be updated manually if you rename a tag they reference.
