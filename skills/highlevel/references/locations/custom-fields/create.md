# Create Custom Field

- **Method:** POST
- **Path:** `/locations/{locationId}/customFields`
- **Scopes:** `locations/customFields.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `name` | string | Yes | Display name of the field |
| `dataType` | string | Yes | Field type (see values below) |
| `placeholder` | string | No | Placeholder text |
| `position` | integer | No | Sort position in forms |
| `options` | string[] | Conditional | Required for SINGLE_OPTIONS and MULTIPLE_OPTIONS types |
| `model` | string | No | Model to attach to (e.g., `contact`, `opportunity`) |

### Data Types

| Value | Description |
|-------|-------------|
| `TEXT` | Single-line text |
| `LARGE_TEXT` | Multi-line text |
| `NUMERICAL` | Integer number |
| `PHONE` | Phone number |
| `MONETORY` | Currency amount (note: HL uses this spelling) |
| `CHECKBOX` | Boolean checkbox |
| `SINGLE_OPTIONS` | Dropdown / single select |
| `MULTIPLE_OPTIONS` | Multi-select |
| `FLOAT` | Decimal number |
| `DATE` | Date picker |
| `TEXTBOX_LIST` | List of text entries |
| `FILE_UPLOAD` | File upload field |
| `SIGNATURE` | Signature capture |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/customFields' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "name": "Service Type",
    "dataType": "SINGLE_OPTIONS",
    "placeholder": "Select service",
    "position": 5,
    "options": ["Residential", "Commercial", "Industrial"]
  }'
```

## Response Example

```json
{
  "customField": {
    "id": "cf_xyz789",
    "name": "Service Type",
    "fieldKey": "contact.service_type",
    "dataType": "SINGLE_OPTIONS",
    "placeholder": "Select service",
    "position": 5,
    "options": ["Residential", "Commercial", "Industrial"]
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — invalid dataType or missing options for select types |

## Common Use Cases

Add new custom fields to a location to capture business-specific data on contacts or opportunities. Often used during client onboarding to set up their CRM schema.

## Gotchas

- The data type is spelled `MONETORY` (not MONETARY). This is a known HL API quirk.
- `options` array is required when `dataType` is `SINGLE_OPTIONS` or `MULTIPLE_OPTIONS`, and ignored for other types.
- The `fieldKey` is auto-generated from the name and cannot be manually set.
- Field names must be unique within a location + model combination.
