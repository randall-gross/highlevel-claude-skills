# Create Custom Value

- **Method:** POST
- **Path:** `/locations/{locationId}/customValues`
- **Scopes:** `locations/customValues.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `name` | string | Yes | Key name for the custom value (used in merge tags) |
| `value` | string | Yes | The value to store |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/customValues' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "name": "service_area",
    "value": "Dallas-Fort Worth Metroplex"
  }'
```

## Response Example

```json
{
  "customValue": {
    "id": "cv_ghi789",
    "name": "service_area",
    "fieldKey": "{{location.custom_values.service_area}}",
    "value": "Dallas-Fort Worth Metroplex"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — duplicate name or validation error |

## Common Use Cases

Add a new reusable value snippet that can be referenced in email/SMS templates via merge tags. Used during location setup to configure business-specific content.

## Gotchas

- The `name` becomes part of the merge tag (`{{location.custom_values.<name>}}`). Use snake_case with no spaces.
- Names must be unique within a location. Attempting to create a duplicate returns a 422.
- The `value` is always stored as a string, even for numbers or dates.
