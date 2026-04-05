# Update Custom Field

- **Method:** PUT
- **Path:** `/locations/{locationId}/customFields/{id}`
- **Scopes:** `locations/customFields.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |
| `id` | string | Yes | The custom field ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `name` | string | No | Display name of the field |
| `placeholder` | string | No | Placeholder text |
| `position` | integer | No | Sort position in forms |
| `options` | string[] | No | Options for select-type fields |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/customFields/cf_xyz789' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "name": "Service Category",
    "options": ["Residential", "Commercial", "Industrial", "Government"]
  }'
```

## Response Example

```json
{
  "customField": {
    "id": "cf_xyz789",
    "name": "Service Category",
    "fieldKey": "contact.service_type",
    "dataType": "SINGLE_OPTIONS",
    "placeholder": "Select service",
    "position": 5,
    "options": ["Residential", "Commercial", "Industrial", "Government"]
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid parameters |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — custom field does not exist |
| 422 | Unprocessable Entity — validation error |

## Common Use Cases

Rename a custom field, reorder it, or add/remove options from a dropdown field.

## Gotchas

- The `dataType` **cannot** be changed after creation. Create a new field if you need a different type.
- The `fieldKey` does not change when the `name` is updated.
- When updating `options`, send the full array. Removing an option does not clear that value from existing contacts.
