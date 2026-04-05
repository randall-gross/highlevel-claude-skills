# Update Custom Value

- **Method:** PUT
- **Path:** `/locations/{locationId}/customValues/{id}`
- **Scopes:** `locations/customValues.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |
| `id` | string | Yes | The custom value ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `name` | string | No | Key name for the custom value |
| `value` | string | No | The value to store |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/customValues/cv_ghi789' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "value": "Greater Houston Area"
  }'
```

## Response Example

```json
{
  "customValue": {
    "id": "cv_ghi789",
    "name": "service_area",
    "fieldKey": "{{location.custom_values.service_area}}",
    "value": "Greater Houston Area"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid parameters |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — custom value does not exist |
| 422 | Unprocessable Entity — validation error |

## Common Use Cases

Update a custom value when business information changes, like a new address or service area.

## Gotchas

- Changing the `name` also changes the merge tag. Any templates or workflows referencing the old merge tag will stop resolving.
- Partial updates are supported; send only the field(s) you want to change.
