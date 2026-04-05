# Get Custom Field

- **Method:** GET
- **Path:** `/locations/{locationId}/customFields/{id}`
- **Scopes:** `locations/customFields.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |
| `id` | string | Yes | The custom field ID |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/customFields/cf_abc123' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "customField": {
    "id": "cf_abc123",
    "name": "Preferred Contact Method",
    "fieldKey": "contact.preferred_contact_method",
    "dataType": "SINGLE_OPTIONS",
    "placeholder": "Select method",
    "position": 0,
    "options": ["Email", "Phone", "Text"],
    "model": "contact"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid ID format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — custom field does not exist |

## Common Use Cases

Retrieve details of a specific custom field by ID to verify its configuration or data type.

## Gotchas

- The `id` is the custom field ID (not the `fieldKey`). These are different identifiers.
