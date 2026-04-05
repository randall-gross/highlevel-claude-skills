# List Custom Values

- **Method:** GET
- **Path:** `/locations/{locationId}/customValues`
- **Scopes:** `locations/customValues.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/customValues' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "customValues": [
    {
      "id": "cv_abc123",
      "name": "company_name",
      "fieldKey": "{{location.custom_values.company_name}}",
      "value": "Acme Plumbing"
    },
    {
      "id": "cv_def456",
      "name": "office_address",
      "fieldKey": "{{location.custom_values.office_address}}",
      "value": "123 Main St, Dallas, TX 75001"
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

Retrieve all custom values for a location to use in template rendering or to display location-specific configuration in a settings UI.

## Gotchas

- Custom values are different from custom fields. Values are simple name/value pairs used as merge variables in templates and messages. Fields define schema on contacts/opportunities.
- The `fieldKey` contains the merge tag syntax (e.g., `{{location.custom_values.company_name}}`).
