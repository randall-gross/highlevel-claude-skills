# Get Calendar

- **Method:** GET
- **Path:** `/calendars/{calendarId}`
- **Scopes:** `calendars.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| calendarId | string | Yes | Calendar ID |

## Request Example

```bash
curl --request GET \
  --url 'https://services.leadconnectorhq.com/calendars/cal_abc123' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "calendar": {
    "id": "cal_abc123",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Service Appointments",
    "description": "Main service calendar",
    "slug": "service-appointments",
    "widgetSlug": "service-appointments",
    "calendarType": "round_robin",
    "teamMembers": [
      {
        "userId": "user_123",
        "priority": 1,
        "meetingLocationType": "default",
        "isPrimary": true
      }
    ],
    "eventTitle": "{{contact.name}} - Service Appointment",
    "eventColor": "#039be5",
    "slotDuration": 30,
    "slotInterval": 30,
    "slotBuffer": 0,
    "availability": {
      "monday": [{ "startTime": "09:00", "endTime": "17:00" }],
      "tuesday": [{ "startTime": "09:00", "endTime": "17:00" }],
      "wednesday": [{ "startTime": "09:00", "endTime": "17:00" }],
      "thursday": [{ "startTime": "09:00", "endTime": "17:00" }],
      "friday": [{ "startTime": "09:00", "endTime": "17:00" }]
    },
    "isActive": true,
    "dateUpdated": "2024-01-15T10:00:00.000Z",
    "dateCreated": "2024-01-01T10:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Invalid calendarId format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Calendar not found |

## Common Use Cases

Fetch full calendar details including availability windows, team members, and configuration for rendering a booking widget.

## Gotchas

- The `availability` object uses 24-hour time strings, not epoch timestamps.
- `teamMembers` array may be empty if the calendar is unassigned.
