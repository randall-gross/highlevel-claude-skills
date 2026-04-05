# Update DND Status

- **Method:** POST
- **Path:** `/contacts/dnd/update`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `contactIds` | string[] | Yes | Array of contact IDs to update |
| `locationId` | string | Yes | The sub-account ID |
| `dndSettings` | object | Yes | DND settings object (see below) |

### DND Settings Object
| Field | Type | Description |
|-------|------|-------------|
| `all` | object | Global DND: `{ "status": "active" \| "inactive" }` |
| `email` | object | Email-specific DND: `{ "status": "active" \| "inactive" }` |
| `sms` | object | SMS-specific DND: `{ "status": "active" \| "inactive" }` |
| `call` | object | Phone call DND: `{ "status": "active" \| "inactive" }` |
| `fb` | object | Facebook Messenger DND: `{ "status": "active" \| "inactive" }` |
| `gmb` | object | Google My Business DND: `{ "status": "active" \| "inactive" }` |

## Request Example

### Enable DND for all channels
```bash
curl -X POST \
  'https://services.leadconnectorhq.com/contacts/dnd/update' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "contactIds": ["nmFmQEsNgz6AVpgLVUJ0"],
    "dndSettings": {
      "all": { "status": "active" }
    }
  }'
```

### Disable DND for email only
```bash
curl -X POST \
  'https://services.leadconnectorhq.com/contacts/dnd/update' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "contactIds": ["nmFmQEsNgz6AVpgLVUJ0", "pQr3sTuVwXyZ1234abcd"],
    "dndSettings": {
      "email": { "status": "inactive" }
    }
  }'
```

## Response Example

```json
{
  "succeeded": true
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing required fields or invalid status value |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — one or more contactIds do not exist |

## Common Use Cases
Honor unsubscribe requests by enabling DND, manage channel-specific opt-outs (e.g., stop SMS but allow email), or re-enable communications after a contact opts back in.

## Gotchas
- Setting `all.status` to `active` overrides all channel-specific settings. The contact will not receive ANY outbound communications.
- Channel-specific settings only apply when `all.status` is `inactive`. If `all` is `active`, individual channel settings are ignored.
- Status values are `active` (DND ON, no messages) and `inactive` (DND OFF, messages allowed). This is counterintuitive — `active` means "actively blocking."
- This supports multiple contact IDs in a single request, making it a bulk operation.
- DND does not prevent manual messages sent directly from the HL conversation view, only automated/API-triggered messages.
