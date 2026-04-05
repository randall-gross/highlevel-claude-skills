# Delete Calendar Notification

- **Method:** DELETE
- **Path:** `/calendars/{calendarId}/notifications/{notificationId}`
- **Scopes:** `calendars.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| calendarId | string | Yes | Calendar ID |
| notificationId | string | Yes | Notification ID |

## Request Example

```bash
curl --request DELETE \
  --url 'https://services.leadconnectorhq.com/calendars/cal_abc123/notifications/notif_001' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "success": true
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Invalid IDs |
| 401 | Unauthorized — invalid or expired token |
| 404 | Calendar or notification not found |

## Common Use Cases

Remove a notification rule that is no longer needed for a calendar.

## Gotchas

- Deletion is permanent. Consider setting `isActive: false` via update instead.
- Deleting a notification stops future sends but does not recall notifications already queued or sent.
