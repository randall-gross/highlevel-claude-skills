# Delete Appointment Note

- **Method:** DELETE
- **Path:** `/calendars/appointments/{appointmentId}/notes/{noteId}`
- **Scopes:** `calendars/events.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| appointmentId | string | Yes | Appointment ID |
| noteId | string | Yes | Note ID |

## Request Example

```bash
curl --request DELETE \
  --url 'https://services.leadconnectorhq.com/calendars/appointments/evt_abc123/notes/note_001' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "success": true
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Invalid IDs |
| 401 | Unauthorized — invalid or expired token |
| 404 | Appointment or note not found |

## Common Use Cases

Remove an outdated or incorrect note from an appointment.

## Gotchas

- Deletion is permanent and cannot be undone.
- Both `appointmentId` and `noteId` must match — you cannot delete a note from a different appointment.
