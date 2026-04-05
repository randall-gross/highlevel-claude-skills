# Create Block Slot

- **Method:** POST
- **Path:** `/calendars/events/block-slots`
- **Scopes:** `calendars/events.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| calendarId | string | Yes | Calendar ID |
| locationId | string | Yes | Location ID |
| startTime | string | Yes | ISO 8601 start time |
| endTime | string | Yes | ISO 8601 end time |
| title | string | No | Block slot title/reason |
| assignedUserId | string | No | Team member this block applies to |

## Request Example

```json
{
  "calendarId": "cal_abc123",
  "locationId": "ve9EPM428h8vShlRW1KT",
  "startTime": "2024-02-05T12:00:00.000Z",
  "endTime": "2024-02-05T13:00:00.000Z",
  "title": "Lunch Break",
  "assignedUserId": "user_123"
}
```

## Response Example

```json
{
  "event": {
    "id": "evt_block_new789",
    "calendarId": "cal_abc123",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "title": "Lunch Break",
    "startTime": "2024-02-05T12:00:00.000Z",
    "endTime": "2024-02-05T13:00:00.000Z",
    "assignedUserId": "user_123",
    "dateCreated": "2024-02-01T10:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing required fields or invalid time format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Calendar not found |
| 422 | Unprocessable Entity |

## Common Use Cases

Block off time on a calendar for meetings, breaks, or other non-bookable periods.

## Gotchas

- Block slots use ISO 8601 strings for times (same as appointments, NOT epoch ms).
- Block slots are events — they can be deleted via the general `DELETE /calendars/events/{eventId}` endpoint.
- There is no overlap validation — you can create overlapping block slots.
