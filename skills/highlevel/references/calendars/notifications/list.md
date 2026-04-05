# List Calendar Notifications

- **Method:** GET
- **Path:** `/calendars/{calendarId}/notifications`
- **Scopes:** `calendars.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| calendarId | string | Yes | Calendar ID |

## Request Example

```bash
curl --request GET \
  --url 'https://services.leadconnectorhq.com/calendars/cal_abc123/notifications' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "notifications": [
    {
      "id": "notif_001",
      "calendarId": "cal_abc123",
      "type": "email",
      "channel": "confirmation",
      "isActive": true,
      "timing": "immediate",
      "templateId": "tpl_abc123",
      "dateCreated": "2024-01-01T10:00:00.000Z",
      "dateUpdated": "2024-01-15T10:00:00.000Z"
    },
    {
      "id": "notif_002",
      "calendarId": "cal_abc123",
      "type": "sms",
      "channel": "reminder",
      "isActive": true,
      "timing": "24h_before",
      "templateId": "tpl_def456",
      "dateCreated": "2024-01-01T10:00:00.000Z",
      "dateUpdated": "2024-01-15T10:00:00.000Z"
    }
  ]
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Invalid calendarId |
| 401 | Unauthorized — invalid or expired token |
| 404 | Calendar not found |

## Common Use Cases

View all notification rules configured for a calendar to audit or manage reminders and confirmations.

## Gotchas

- Notifications are per-calendar, not per-appointment. They define rules that apply to all events on the calendar.
- Common channels: `confirmation`, `reminder`, `cancellation`, `followup`.
- Common types: `email`, `sms`.
