# Create Calendar

- **Method:** POST
- **Path:** `/calendars/`
- **Scopes:** `calendars.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| name | string | Yes | Calendar name |
| description | string | No | Calendar description |
| slug | string | No | URL slug for booking widget |
| calendarType | string | No | Type: `round_robin`, `collective`, `class_booking`, `service_booking`, `personal` |
| teamMembers | array | No | Array of team member objects |
| eventTitle | string | No | Template for event titles (supports merge fields) |
| eventColor | string | No | Hex color for calendar events |
| slotDuration | number | No | Appointment duration in minutes |
| slotInterval | number | No | Interval between available slots in minutes |
| slotBuffer | number | No | Buffer time between appointments in minutes |
| availability | object | No | Weekly availability windows |
| formId | string | No | Form ID to use for booking |
| isActive | boolean | No | Whether calendar is active |

## Request Example

```json
{
  "locationId": "ve9EPM428h8vShlRW1KT",
  "name": "Consultation Calls",
  "description": "30-minute discovery calls",
  "calendarType": "round_robin",
  "slotDuration": 30,
  "slotInterval": 30,
  "slotBuffer": 10,
  "teamMembers": [
    {
      "userId": "user_123",
      "priority": 1,
      "meetingLocationType": "default",
      "isPrimary": true
    }
  ],
  "availability": {
    "monday": [{ "startTime": "09:00", "endTime": "17:00" }],
    "tuesday": [{ "startTime": "09:00", "endTime": "17:00" }],
    "wednesday": [{ "startTime": "09:00", "endTime": "17:00" }],
    "thursday": [{ "startTime": "09:00", "endTime": "17:00" }],
    "friday": [{ "startTime": "09:00", "endTime": "17:00" }]
  },
  "isActive": true
}
```

## Response Example

```json
{
  "calendar": {
    "id": "cal_new456",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Consultation Calls",
    "description": "30-minute discovery calls",
    "calendarType": "round_robin",
    "slotDuration": 30,
    "slotInterval": 30,
    "slotBuffer": 10,
    "isActive": true,
    "dateCreated": "2024-02-01T10:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing required fields or invalid values |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — validation errors |

## Common Use Cases

Programmatically create calendars for new service types or team members during onboarding.

## Gotchas

- The trailing slash on `/calendars/` is required.
- `slug` must be unique within the location. If omitted, one is auto-generated from the name.
- `availability` uses 24-hour time strings (e.g., `"09:00"`, `"17:00"`), not epoch timestamps.
