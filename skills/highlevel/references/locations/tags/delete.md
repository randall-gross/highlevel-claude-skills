# Delete Tag

- **Method:** DELETE
- **Path:** `/locations/{locationId}/tags/{tagId}`
- **Scopes:** `locations/tags.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |
| `tagId` | string | Yes | The tag ID |

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/tags/tag_new123' \
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
| 404 | Not Found — tag does not exist |

## Common Use Cases

Remove a tag that is no longer relevant to the business's CRM workflow.

## Gotchas

- Deleting a tag **removes it from all contacts** that had it. This is irreversible.
- Workflows that trigger on this tag will no longer fire for new contacts, but previously triggered actions are unaffected.
