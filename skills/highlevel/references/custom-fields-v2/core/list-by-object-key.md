# List Custom Fields by Object Key

- **Method:** GET
- **Path:** `/custom-fields/object-key/{objectKey}`
- **Scopes:** Varies by object type
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `objectKey` | string | Yes | The object type key (e.g., `contacts`, `opportunities`, `custom_objects.project`) |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/custom-fields/object-key/contacts' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "customFields": [
    {
      "id": "cf_abc123",
      "objectKey": "contacts",
      "name": "Lead Source",
      "fieldKey": "contact.lead_source",
      "dataType": "SINGLE_OPTIONS",
      "placeholder": "Select lead source",
      "options": ["Website", "Referral", "Google Ads", "Facebook"],
      "folderId": "folder_abc123",
      "position": 0
    },
    {
      "id": "cf_def456",
      "objectKey": "contacts",
      "name": "Annual Revenue",
      "fieldKey": "contact.annual_revenue",
      "dataType": "MONETORY",
      "placeholder": "Enter annual revenue",
      "options": [],
      "folderId": null,
      "position": 1
    }
  ]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — invalid object key |

## Common Use Cases
Discover all custom fields on an object to build dynamic forms. Map field IDs to field names for display.

## Gotchas
The `objectKey` for custom objects must include the `custom_objects.` prefix. The `fieldKey` in the response is what you use in contacts API custom field arrays. Note the typo: HL uses `MONETORY` (not `MONETARY`) for currency fields.
