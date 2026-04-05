# Delete Custom Value

- **Method:** DELETE
- **Path:** `/locations/{locationId}/customValues/{id}`
- **Scopes:** `locations/customValues.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |
| `id` | string | Yes | The custom value ID |

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/customValues/cv_ghi789' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "success": true
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid ID format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — custom value does not exist |

## Common Use Cases

Remove a custom value that is no longer needed.

## Gotchas

- Deleting a custom value breaks any templates or workflows that reference its merge tag. The merge tag will render as empty text instead of the value.
- This is irreversible.
