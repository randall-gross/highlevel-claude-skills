# Update Calendar

- **Method:** PUT
- **Path:** `/calendars/{calendarId}`
- **Scopes:** `calendars.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| calendarId | string | Yes | Calendar ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| name | string | No | Calendar name |
| description | string | No | Calendar description |
| slug | string | No | URL slug |
| calendarType | string | No | Calendar type |
| teamMembers | array | No | Team member objects |
| eventTitle | string | No | Event title template |
| eventColor | string | No | Hex color |
| slotDuration | number | No | Duration in minutes |
| slotInterval | number | No | Interval in minutes |
| slotBuffer | number | No | Buffer in minutes |
| availability | object | No | Weekly availability |
| isActive | boolean | No | Active status |

## Request Example

```bash
curl --request PUT \
  --url 'https://services.leadconnectorhq.com/calendars/cal_abc123' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "name": "Updated Calendar Name",
    "slotDuration": 60,
    "slotBuffer": 15
  }'
```

## Response Example

```json
{
  "calendar": {
    "id": "cal_abc123",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Updated Calendar Name",
    "slotDuration": 60,
    "slotBuffer": 15,
    "isActive": true,
    "dateUpdated": "2024-02-01T12:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Invalid request body |
| 401 | Unauthorized — invalid or expired token |
| 404 | Calendar not found |
| 422 | Unprocessable Entity — validation errors |

## Common Use Cases

Update calendar settings like slot duration, availability windows, or team member assignments.

## Gotchas

- Partial updates are supported — only send fields you want to change.
- Updating `teamMembers` replaces the entire array; you must include all members, not just new ones.
