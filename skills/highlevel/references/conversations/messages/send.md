# Send Message

- **Method:** POST
- **Path:** `/conversations/messages`
- **Scopes:** `conversations/message.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `type` | string | Yes | `SMS`, `Email`, `WhatsApp`, `GMB`, `IG`, `FB`, `Custom`, `Live_Chat` |
| `contactId` | string | Yes | The contact ID to message |
| `message` | string | Conditional | Text body (required for SMS, WhatsApp, Live_Chat) |
| `html` | string | Conditional | HTML body (required for Email) |
| `subject` | string | Conditional | Email subject (required for Email) |
| `emailFrom` | string | No | Sender email address (defaults to location email) |
| `emailTo` | string | No | Override recipient email |
| `emailCc` | string[] | No | CC email addresses |
| `emailBcc` | string[] | No | BCC email addresses |
| `emailReplyMode` | string | No | `reply` or `reply_all` for email threads |
| `attachments` | string[] | No | Array of attachment URLs (from upload endpoint) |
| `conversationId` | string | No | Existing conversation ID (auto-resolved if omitted) |
| `conversationProviderId` | string | No | Provider-specific conversation ID |
| `scheduledTimestamp` | number | No | Unix timestamp (ms) to schedule send |
| `replyMessageId` | string | No | Message ID to reply to (for threading) |

## Request Example (SMS)

```bash
curl --request POST \
  --url https://services.leadconnectorhq.com/conversations/messages \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "type": "SMS",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "message": "Hi! Your appointment is confirmed for tomorrow at 2 PM."
  }'
```

## Request Example (Email)

```bash
curl --request POST \
  --url https://services.leadconnectorhq.com/conversations/messages \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "type": "Email",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "subject": "Appointment Confirmation",
    "html": "<p>Hi! Your appointment is confirmed for <strong>tomorrow at 2 PM</strong>.</p>",
    "emailFrom": "team@business.com"
  }'
```

## Response Example

```json
{
  "message": {
    "id": "msg_xyz789",
    "conversationId": "conv_abc123",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "type": "TYPE_SMS",
    "direction": "outbound",
    "status": "pending",
    "body": "Hi! Your appointment is confirmed for tomorrow at 2 PM.",
    "dateAdded": "2026-04-04T10:00:00.000Z"
  },
  "conversationId": "conv_abc123",
  "messageId": "msg_xyz789"
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad request -- missing required fields, invalid type, or contact lacks phone/email |
| 401 | Unauthorized -- invalid or expired token |
| 422 | Unprocessable -- contact not found, or phone/email not configured for location |

## Common Use Cases

Send appointment reminders via SMS. Send follow-up emails after form submissions. Schedule messages for future delivery. Send WhatsApp messages for international contacts.

## Gotchas

- The `type` values here do NOT use the `TYPE_` prefix (use `SMS` not `TYPE_SMS`). This differs from the conversation type field.
- If `conversationId` is omitted, the API auto-finds or creates a conversation for the contact on that channel.
- The contact must have a phone number for SMS/WhatsApp or an email for Email type. If missing, the API returns 400.
- For SMS, the location must have an active phone number (Twilio/LC Phone) configured.
- `scheduledTimestamp` is in milliseconds (not seconds). A message scheduled in the past sends immediately.
- Attachments must be pre-uploaded URLs from the upload endpoint, not raw file data.
