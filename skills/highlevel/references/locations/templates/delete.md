# Delete Template

- **Method:** DELETE
- **Path:** `/locations/{locationId}/templates/{id}`
- **Scopes:** `locations/templates.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |
| `id` | string | Yes | The template ID |

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/templates/tmpl_abc123' \
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
| 404 | Not Found — template does not exist |
| 422 | Unprocessable Entity — template cannot be deleted |

## Common Use Cases

Remove an outdated or unused email/SMS template from a location.

## Gotchas

- Templates used in active workflows or campaigns may cause those automations to fail silently after deletion.
- The delete may be a soft-delete (template becomes recoverable via `deleted=true` on the list endpoint). Verify with the list endpoint if permanent deletion is needed.
- The required scope is `locations/templates.readonly` per HL docs, which appears to be a documentation inconsistency — a write scope may be needed in practice.
