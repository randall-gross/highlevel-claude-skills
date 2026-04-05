# Create Calendar Notification

- **Method:** POST
- **Path:** `/calendars/{calendarId}/notifications`
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
| type | string | Yes | Notification type: `email` or `sms` |
| channel | string | Yes | Trigger: `confirmation`, `reminder`, `cancellation`, `followup` |
| timing | string | Yes | When to send: `immediate`, `24h_before`, `1h_before`, etc. |
| templateId | string | No | Email/SMS template ID |
| subject | string | No | Email subject line (email type only) |
| isActive | boolean | No | Whether notification is active (default: true) |

## Request Example

```json
{
  "type": "sms",
  "channel": "reminder",
  "timing": "1h_before",
  "templateId": "tpl_sms123",
  "isActive": true
}
```

## Response Example

```json
{
  "notification": {
    "id": "notif_new789",
    "calendarId": "cal_abc123",
    "type": "sms",
    "channel": "reminder",
    "timing": "1h_before",
    "templateId": "tpl_sms123",
    "isActive": true,
    "dateCreated": "2024-02-01T10:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing required fields or invalid type/channel |
| 401 | Unauthorized — invalid or expired token |
| 404 | Calendar not found |
| 422 | Unprocessable Entity — invalid templateId or conflicting notification |

## Common Use Cases

Set up automated SMS reminders or email confirmations for calendar bookings.

## Gotchas

- Creating duplicate notifications (same type + channel + timing) may be rejected with 422.
- The `templateId` must reference an existing template in the location.
- `timing` values vary by channel — reminders support time-before values, confirmations are typically `immediate`.
