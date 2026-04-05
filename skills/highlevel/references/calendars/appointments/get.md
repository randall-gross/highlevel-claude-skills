# Get Appointment

- **Method:** GET
- **Path:** `/calendars/events/appointments/{eventId}`
- **Scopes:** `calendars/events.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| eventId | string | Yes | Event/appointment ID |

## Request Example

```bash
curl --request GET \
  --url 'https://services.leadconnectorhq.com/calendars/events/appointments/evt_abc123' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "event": {
    "id": "evt_abc123",
    "calendarId": "cal_abc123",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "title": "John Doe - Consultation",
    "appointmentStatus": "confirmed",
    "startTime": "2024-02-01T10:00:00.000Z",
    "endTime": "2024-02-01T10:30:00.000Z",
    "assignedUserId": "user_123",
    "notes": "",
    "address": "",
    "dateCreated": "2024-01-28T14:00:00.000Z",
    "dateUpdated": "2024-01-28T14:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Invalid eventId format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Appointment not found |

## Common Use Cases

Fetch appointment details to display in a CRM view or confirm booking details with a contact.

## Gotchas

- The `appointmentStatus` field can be: `new`, `confirmed`, `cancelled`, `showed`, `noshow`, `invalid`.
- `contactId` links to the Contacts domain — use it to fetch contact details separately.
