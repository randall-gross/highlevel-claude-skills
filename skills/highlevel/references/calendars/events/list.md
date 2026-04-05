# List Calendar Events

- **Method:** GET
- **Path:** `/calendars/events`
- **Scopes:** `calendars/events.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| startTime | string | Yes | Start time filter (epoch milliseconds) |
| endTime | string | Yes | End time filter (epoch milliseconds) |
| calendarId | string | No | Filter by specific calendar |
| userId | string | No | Filter by assigned team member |

## Request Example

```bash
curl --request GET \
  --url 'https://services.leadconnectorhq.com/calendars/events?locationId=ve9EPM428h8vShlRW1KT&startTime=1706745600000&endTime=1707350400000&calendarId=cal_abc123' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "events": [
    {
      "id": "evt_abc123",
      "calendarId": "cal_abc123",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "contactId": "nmFmQEsNgz6AVpgLVUJ0",
      "title": "John Doe - Consultation",
      "appointmentStatus": "confirmed",
      "startTime": "2024-02-01T10:00:00.000Z",
      "endTime": "2024-02-01T10:30:00.000Z",
      "assignedUserId": "user_123",
      "dateCreated": "2024-01-28T14:00:00.000Z"
    },
    {
      "id": "evt_block001",
      "calendarId": "cal_abc123",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "title": "Lunch Break",
      "startTime": "2024-02-01T12:00:00.000Z",
      "endTime": "2024-02-01T13:00:00.000Z",
      "assignedUserId": "user_123",
      "dateCreated": "2024-01-28T10:00:00.000Z"
    }
  ]
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing required query parameters or invalid format |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity |

## Common Use Cases

Fetch all events (appointments + block slots) across calendars for a date range. Used to build calendar views, generate reports, or sync with external systems.

## Gotchas

- **`startTime` and `endTime` use epoch milliseconds** (e.g., `1706745600000`), matching the free-slots convention.
- Returns BOTH appointments and block slots. Distinguish by checking for `contactId` (appointments have it, block slots do not) or `appointmentStatus`.
- Without `calendarId`, returns events from ALL calendars in the location.
- Results may not be paginated — for very large date ranges, the response can be substantial.
