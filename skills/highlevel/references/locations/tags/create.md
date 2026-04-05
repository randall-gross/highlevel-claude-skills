# Create Tag

- **Method:** POST
- **Path:** `/locations/{locationId}/tags`
- **Scopes:** `locations/tags.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `name` | string | Yes | Tag name |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/tags' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "name": "Hot Lead"
  }'
```

## Response Example

```json
{
  "tag": {
    "id": "tag_new123",
    "name": "Hot Lead",
    "locationId": "ve9EPM428h8vShlRW1KT"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing name |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — duplicate tag name |

## Common Use Cases

Create a new tag for categorizing contacts or opportunities. Often done during workflow setup or CRM configuration.

## Gotchas

- Tag names must be unique within a location (case-sensitive). Creating "Hot Lead" when "Hot Lead" already exists returns a 422.
- Tags created via API are identical to tags created in the HL UI. There is no distinction.
