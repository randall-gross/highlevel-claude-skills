# Get Free Slots

- **Method:** GET
- **Path:** `/calendars/{calendarId}/free-slots`
- **Scopes:** `calendars.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| calendarId | string | Yes | Calendar ID |

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| startDate | number | Yes | Start date in epoch milliseconds |
| endDate | number | Yes | End date in epoch milliseconds |
| timezone | string | No | IANA timezone (e.g., `America/New_York`) |
| userId | string | No | Filter slots for a specific team member |

## Request Example

```bash
curl --request GET \
  --url 'https://services.leadconnectorhq.com/calendars/cal_abc123/free-slots?startDate=1706745600000&endDate=1707350400000&timezone=America/New_York' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "slots": {
    "2024-02-01": [
      "2024-02-01T09:00:00-05:00",
      "2024-02-01T09:30:00-05:00",
      "2024-02-01T10:00:00-05:00",
      "2024-02-01T10:30:00-05:00",
      "2024-02-01T11:00:00-05:00",
      "2024-02-01T14:00:00-05:00",
      "2024-02-01T14:30:00-05:00",
      "2024-02-01T15:00:00-05:00"
    ],
    "2024-02-02": [
      "2024-02-02T09:00:00-05:00",
      "2024-02-02T09:30:00-05:00",
      "2024-02-02T10:00:00-05:00"
    ]
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing startDate/endDate or invalid format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Calendar not found |
| 422 | Unprocessable Entity |

## Common Use Cases

Power a booking widget by showing available time slots for a given date range. Used in custom scheduling UIs.

## Gotchas

- **Dates must be epoch milliseconds** (e.g., `1706745600000`), NOT ISO strings or seconds.
- Response slots are grouped by date as ISO strings with timezone offset.
- Slots respect the calendar's `slotDuration`, `slotInterval`, `slotBuffer`, existing appointments, and team member availability.
- Large date ranges (30+ days) may return very large payloads. Keep ranges tight for performance.
- If `timezone` is omitted, defaults to the location's timezone setting.
