# Delete Custom Field

- **Method:** DELETE
- **Path:** `/locations/{locationId}/customFields/{id}`
- **Scopes:** `locations/customFields.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |
| `id` | string | Yes | The custom field ID |

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/customFields/cf_xyz789' \
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
| 404 | Not Found — custom field does not exist |
| 422 | Unprocessable Entity — field cannot be deleted |

## Common Use Cases

Remove a custom field that is no longer needed from the location's schema.

## Gotchas

- Deleting a custom field **removes all stored values** for that field across all contacts/opportunities. This is irreversible.
- Fields used in active workflows, forms, or automations may cause those to break silently after deletion.
