# Get Calendar Notification

- **Method:** GET
- **Path:** `/calendars/{calendarId}/notifications/{notificationId}`
- **Scopes:** `calendars.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| calendarId | string | Yes | Calendar ID |
| notificationId | string | Yes | Notification ID |

## Request Example

```bash
curl --request GET \
  --url 'https://services.leadconnectorhq.com/calendars/cal_abc123/notifications/notif_001' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "notification": {
    "id": "notif_001",
    "calendarId": "cal_abc123",
    "type": "email",
    "channel": "confirmation",
    "isActive": true,
    "timing": "immediate",
    "templateId": "tpl_abc123",
    "subject": "Your appointment is confirmed!",
    "dateCreated": "2024-01-01T10:00:00.000Z",
    "dateUpdated": "2024-01-15T10:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Invalid IDs |
| 401 | Unauthorized — invalid or expired token |
| 404 | Calendar or notification not found |

## Common Use Cases

Fetch full notification configuration details to display in an admin settings panel.

## Gotchas

- Both `calendarId` and `notificationId` must match — a notification belongs to a specific calendar.
