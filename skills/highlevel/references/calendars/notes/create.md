# Create Appointment Note

- **Method:** POST
- **Path:** `/calendars/appointments/{appointmentId}/notes`
- **Scopes:** `calendars/events.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| appointmentId | string | Yes | Appointment ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| body | string | Yes | Note content |

## Request Example

```bash
curl --request POST \
  --url 'https://services.leadconnectorhq.com/calendars/appointments/evt_abc123/notes' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "body": "Client confirmed they will attend. Bring proposal documents."
  }'
```

## Response Example

```json
{
  "note": {
    "id": "note_003",
    "appointmentId": "evt_abc123",
    "body": "Client confirmed they will attend. Bring proposal documents.",
    "userId": "user_123",
    "dateCreated": "2024-01-30T09:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing body field or invalid request |
| 401 | Unauthorized — invalid or expired token |
| 404 | Appointment not found |
| 422 | Unprocessable Entity |

## Common Use Cases

Add internal context to an appointment, such as pre-call prep notes or post-call follow-up actions.

## Gotchas

- Notes are plain text. HTML/markdown formatting is not rendered in the HighLevel UI.
- The `userId` is automatically set to the authenticated user.
