# List Email/SMS Templates

- **Method:** GET
- **Path:** `/locations/{locationId}/templates`
- **Scopes:** `locations/templates.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `type` | string | No | Filter by template type: `email`, `sms` |
| `originId` | string | No | Filter by origin/parent ID |
| `deleted` | boolean | No | Include soft-deleted templates (default: false) |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/templates?type=email' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "templates": [
    {
      "id": "tmpl_abc123",
      "name": "Welcome Email",
      "type": "email",
      "subject": "Welcome to {{location.custom_values.company_name}}!",
      "body": "<html><body><h1>Welcome!</h1><p>Thank you for choosing us.</p></body></html>",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "createdAt": "2026-01-15T10:00:00.000Z",
      "updatedAt": "2026-03-20T14:30:00.000Z"
    },
    {
      "id": "tmpl_def456",
      "name": "Appointment Reminder",
      "type": "sms",
      "body": "Hi {{contact.first_name}}, this is a reminder about your appointment tomorrow at {{appointment.time}}.",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "createdAt": "2026-02-01T10:00:00.000Z",
      "updatedAt": "2026-02-01T10:00:00.000Z"
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

List all email or SMS templates in a location for display in a template picker, or to audit existing templates before creating new ones.

## Gotchas

- Email templates include a `subject` field; SMS templates do not.
- Template bodies may contain merge tags (e.g., `{{contact.first_name}}`) that are resolved at send time.
- Soft-deleted templates are excluded by default. Pass `deleted=true` to include them.
