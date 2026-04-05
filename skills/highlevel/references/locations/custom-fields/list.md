# List Custom Fields

- **Method:** GET
- **Path:** `/locations/{locationId}/customFields`
- **Scopes:** `locations/customFields.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `model` | string | No | Filter by model type (e.g., `contact`, `opportunity`) |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/customFields' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "customFields": [
    {
      "id": "cf_abc123",
      "name": "Preferred Contact Method",
      "fieldKey": "contact.preferred_contact_method",
      "dataType": "SINGLE_OPTIONS",
      "placeholder": "Select method",
      "position": 0,
      "options": ["Email", "Phone", "Text"],
      "model": "contact"
    },
    {
      "id": "cf_def456",
      "name": "Budget Range",
      "fieldKey": "contact.budget_range",
      "dataType": "MONETORY",
      "placeholder": "$0.00",
      "position": 1,
      "model": "contact"
    }
  ]
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid locationId |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — location does not exist |

## Common Use Cases

Retrieve all custom fields for a location to build dynamic forms or map field IDs for contact imports.

## Gotchas

- The `fieldKey` is the programmatic key used when setting values on contacts (e.g., in contact create/update payloads).
- Returns all custom fields across all models unless filtered with the `model` query parameter.
