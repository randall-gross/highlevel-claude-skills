# List Blocked Slots

- **Method:** GET
- **Path:** `/calendars/blocked-slots`
- **Scopes:** `calendars/events.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| startDate | string | No | Start date filter (ISO 8601) |
| endDate | string | No | End date filter (ISO 8601) |
| calendarId | string | No | Filter by calendar |

## Request Example

```bash
curl --request GET \
  --url 'https://services.leadconnectorhq.com/calendars/blocked-slots?locationId=ve9EPM428h8vShlRW1KT&startDate=2024-02-01&endDate=2024-02-28&calendarId=cal_abc123' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "events": [
    {
      "id": "evt_block001",
      "calendarId": "cal_abc123",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "title": "Team Meeting",
      "startTime": "2024-02-05T13:00:00.000Z",
      "endTime": "2024-02-05T14:00:00.000Z",
      "assignedUserId": "user_123",
      "dateCreated": "2024-01-28T10:00:00.000Z"
    }
  ]
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing locationId or invalid date format |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases

View all blocked time slots on a calendar to understand unavailable periods and manage team schedules.

## Gotchas

- Date filters use ISO 8601 strings here, NOT epoch milliseconds (unlike free-slots).
- Without date filters, returns all blocked slots which may be a large set.
- Blocked slots reduce available free slots — they appear as unavailable in booking widgets.
