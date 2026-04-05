# Update Appointment

- **Method:** PUT
- **Path:** `/calendars/events/appointments/{eventId}`
- **Scopes:** `calendars/events.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| eventId | string | Yes | Event/appointment ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| calendarId | string | No | Move to different calendar |
| startTime | string | No | ISO 8601 start time |
| endTime | string | No | ISO 8601 end time |
| title | string | No | Appointment title |
| appointmentStatus | string | No | Status update |
| assignedUserId | string | No | Reassign team member |
| address | string | No | Meeting address |
| notes | string | No | Appointment notes |

## Request Example

```bash
curl --request PUT \
  --url 'https://services.leadconnectorhq.com/calendars/events/appointments/evt_abc123' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "appointmentStatus": "confirmed",
    "startTime": "2024-02-02T14:00:00.000Z",
    "endTime": "2024-02-02T14:30:00.000Z"
  }'
```

## Response Example

```json
{
  "event": {
    "id": "evt_abc123",
    "calendarId": "cal_abc123",
    "appointmentStatus": "confirmed",
    "startTime": "2024-02-02T14:00:00.000Z",
    "endTime": "2024-02-02T14:30:00.000Z",
    "dateUpdated": "2024-01-30T10:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Invalid request body |
| 401 | Unauthorized — invalid or expired token |
| 404 | Appointment not found |
| 422 | Unprocessable Entity |

## Common Use Cases

Reschedule an appointment, update its status (e.g., mark as confirmed or noshow), or reassign to a different team member.

## Gotchas

- Partial updates are supported — only send fields you want to change.
- Changing `appointmentStatus` may trigger workflow automations configured in HighLevel.
- No automatic slot availability check — you can reschedule into an occupied slot.
