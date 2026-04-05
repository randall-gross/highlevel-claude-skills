# List Appointment Notes

- **Method:** GET
- **Path:** `/calendars/appointments/{appointmentId}/notes`
- **Scopes:** `calendars/events.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| appointmentId | string | Yes | Appointment ID |

## Request Example

```bash
curl --request GET \
  --url 'https://services.leadconnectorhq.com/calendars/appointments/evt_abc123/notes' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "notes": [
    {
      "id": "note_001",
      "appointmentId": "evt_abc123",
      "body": "Client requested afternoon slot. Prefers video call.",
      "userId": "user_123",
      "dateCreated": "2024-01-29T10:00:00.000Z",
      "dateUpdated": "2024-01-29T10:00:00.000Z"
    },
    {
      "id": "note_002",
      "appointmentId": "evt_abc123",
      "body": "Follow-up: send proposal after call.",
      "userId": "user_123",
      "dateCreated": "2024-01-29T11:00:00.000Z",
      "dateUpdated": "2024-01-29T11:00:00.000Z"
    }
  ]
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Invalid appointmentId |
| 401 | Unauthorized — invalid or expired token |
| 404 | Appointment not found |

## Common Use Cases

Display all internal notes for an appointment in a CRM detail view or prepare context before a scheduled call.

## Gotchas

- Notes are internal team notes, NOT visible to the contact.
- The `appointmentId` in the path is the same as the `eventId` used in other appointment endpoints.
