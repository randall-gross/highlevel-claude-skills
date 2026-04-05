# Update Calendar Notification

- **Method:** PUT
- **Path:** `/calendars/{calendarId}/notifications/{notificationId}`
- **Scopes:** `calendars.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| calendarId | string | Yes | Calendar ID |
| notificationId | string | Yes | Notification ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| type | string | No | Notification type |
| channel | string | No | Trigger channel |
| timing | string | No | When to send |
| templateId | string | No | Template ID |
| subject | string | No | Email subject |
| isActive | boolean | No | Active status |

## Request Example

```bash
curl --request PUT \
  --url 'https://services.leadconnectorhq.com/calendars/cal_abc123/notifications/notif_001' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "timing": "2h_before",
    "isActive": true
  }'
```

## Response Example

```json
{
  "notification": {
    "id": "notif_001",
    "calendarId": "cal_abc123",
    "timing": "2h_before",
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
| 404 | Calendar or notification not found |
| 422 | Unprocessable Entity |

## Common Use Cases

Change reminder timing (e.g., from 24h to 1h before), swap templates, or toggle notifications on/off.

## Gotchas

- Partial updates are supported.
- Changing `type` (e.g., email to SMS) may require updating `templateId` to match.
