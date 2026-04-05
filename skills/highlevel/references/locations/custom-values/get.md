# Get Custom Value

- **Method:** GET
- **Path:** `/locations/{locationId}/customValues/{id}`
- **Scopes:** `locations/customValues.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |
| `id` | string | Yes | The custom value ID |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/customValues/cv_abc123' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "customValue": {
    "id": "cv_abc123",
    "name": "company_name",
    "fieldKey": "{{location.custom_values.company_name}}",
    "value": "Acme Plumbing"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid ID format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — custom value does not exist |

## Common Use Cases

Look up a specific custom value by ID to check its current value before updating.

## Gotchas

- The `id` is the custom value record ID, not the `name` or `fieldKey`.
