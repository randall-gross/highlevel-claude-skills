# Update Block Slot

- **Method:** PUT
- **Path:** `/calendars/events/block-slots/{eventId}`
- **Scopes:** `calendars/events.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| eventId | string | Yes | Block slot event ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| calendarId | string | No | Move to different calendar |
| startTime | string | No | ISO 8601 start time |
| endTime | string | No | ISO 8601 end time |
| title | string | No | Block slot title/reason |
| assignedUserId | string | No | Team member assignment |

## Request Example

```bash
curl --request PUT \
  --url 'https://services.leadconnectorhq.com/calendars/events/block-slots/evt_block001' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "startTime": "2024-02-05T12:30:00.000Z",
    "endTime": "2024-02-05T13:30:00.000Z",
    "title": "Extended Lunch Break"
  }'
```

## Response Example

```json
{
  "event": {
    "id": "evt_block001",
    "title": "Extended Lunch Break",
    "startTime": "2024-02-05T12:30:00.000Z",
    "endTime": "2024-02-05T13:30:00.000Z",
    "dateUpdated": "2024-02-01T12:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Invalid request body |
| 401 | Unauthorized — invalid or expired token |
| 404 | Block slot not found |
| 422 | Unprocessable Entity |

## Common Use Cases

Adjust the time or duration of a blocked slot, such as extending a meeting or changing its title.

## Gotchas

- Partial updates are supported.
- To delete a block slot, use `DELETE /calendars/events/{eventId}` (the general event delete endpoint).
- There is no dedicated delete endpoint under `/block-slots/`.
