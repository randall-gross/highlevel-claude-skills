# Create Appointment

- **Method:** POST
- **Path:** `/calendars/events/appointments`
- **Scopes:** `calendars/events.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| calendarId | string | Yes | Calendar to book on |
| locationId | string | Yes | Location ID |
| contactId | string | Yes | Contact being booked |
| startTime | string | Yes | ISO 8601 start time |
| endTime | string | Yes | ISO 8601 end time |
| title | string | No | Appointment title |
| appointmentStatus | string | No | Status: `new`, `confirmed`, `cancelled`, `showed`, `noshow`, `invalid` |
| assignedUserId | string | No | Team member to assign |
| address | string | No | Meeting address |
| notes | string | No | Appointment notes |
| toNotify | boolean | No | Send notification to contact |

## Request Example

```json
{
  "calendarId": "cal_abc123",
  "locationId": "ve9EPM428h8vShlRW1KT",
  "contactId": "nmFmQEsNgz6AVpgLVUJ0",
  "startTime": "2024-02-01T10:00:00.000Z",
  "endTime": "2024-02-01T10:30:00.000Z",
  "title": "Discovery Call - John Doe",
  "appointmentStatus": "confirmed",
  "assignedUserId": "user_123",
  "toNotify": true
}
```

## Response Example

```json
{
  "event": {
    "id": "evt_new789",
    "calendarId": "cal_abc123",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "title": "Discovery Call - John Doe",
    "appointmentStatus": "confirmed",
    "startTime": "2024-02-01T10:00:00.000Z",
    "endTime": "2024-02-01T10:30:00.000Z",
    "assignedUserId": "user_123",
    "dateCreated": "2024-01-29T10:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing required fields or invalid time format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Calendar or contact not found |
| 422 | Unprocessable Entity — time slot unavailable or validation error |

## Common Use Cases

Book an appointment for a contact programmatically, such as from a custom booking form or automated workflow.

## Gotchas

- `startTime` and `endTime` must be ISO 8601 strings (NOT epoch milliseconds like free-slots query params).
- The API does NOT validate slot availability by default — you can double-book. Use free-slots first to check.
- `contactId` must reference an existing contact in the location.
- If `toNotify` is true, the contact receives a confirmation notification via the location's configured channel.
- `appointmentStatus` defaults to `new` if omitted.
