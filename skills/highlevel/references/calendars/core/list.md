# List Calendars

- **Method:** GET
- **Path:** `/calendars/`
- **Scopes:** `calendars.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |

## Request Example

```bash
curl --request GET \
  --url 'https://services.leadconnectorhq.com/calendars/?locationId=ve9EPM428h8vShlRW1KT' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "calendars": [
    {
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
      "isActive": true,
      "dateUpdated": "2024-01-15T10:00:00.000Z",
      "dateCreated": "2024-01-01T10:00:00.000Z"
    }
  ]
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing or invalid locationId |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity |

## Common Use Cases

List all calendars for a location to display in a booking widget or admin dashboard.

## Gotchas

- The trailing slash on `/calendars/` is required.
- Returns all calendar types (round_robin, collective, class_booking, service_booking, etc.).
