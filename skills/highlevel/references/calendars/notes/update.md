# Update Appointment Note

- **Method:** PUT
- **Path:** `/calendars/appointments/{appointmentId}/notes/{noteId}`
- **Scopes:** `calendars/events.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| appointmentId | string | Yes | Appointment ID |
| noteId | string | Yes | Note ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| body | string | Yes | Updated note content |

## Request Example

```bash
curl --request PUT \
  --url 'https://services.leadconnectorhq.com/calendars/appointments/evt_abc123/notes/note_001' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "body": "Client confirmed. Prefers Zoom call. Updated proposal ready."
  }'
```

## Response Example

```json
{
  "note": {
    "id": "note_001",
    "appointmentId": "evt_abc123",
    "body": "Client confirmed. Prefers Zoom call. Updated proposal ready.",
    "userId": "user_123",
    "dateUpdated": "2024-01-30T12:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing body field |
| 401 | Unauthorized — invalid or expired token |
| 404 | Appointment or note not found |
| 422 | Unprocessable Entity |

## Common Use Cases

Correct or add detail to an existing appointment note.

## Gotchas

- The full `body` must be sent — this is a full replacement, not a patch/append.
- Both `appointmentId` and `noteId` must be valid and related.
