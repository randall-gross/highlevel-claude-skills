# Add Inbound Message

- **Method:** POST
- **Path:** `/conversations/messages/inbound`
- **Scopes:** `conversations/message.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `type` | string | Yes | `SMS`, `Email`, `WhatsApp`, `GMB`, `IG`, `FB`, `Custom`, `Live_Chat` |
| `conversationId` | string | Yes | The conversation ID |
| `conversationProviderId` | string | Yes | External provider conversation ID |
| `message` | string | Conditional | Text body (for SMS/WhatsApp/Live_Chat) |
| `html` | string | Conditional | HTML body (for Email) |
| `subject` | string | No | Email subject |
| `attachments` | string[] | No | Array of attachment URLs |
| `altId` | string | No | External message ID for deduplication |

## Request Example

```bash
curl --request POST \
  --url https://services.leadconnectorhq.com/conversations/messages/inbound \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "type": "SMS",
    "conversationId": "conv_abc123",
    "conversationProviderId": "ext_provider_123",
    "message": "I received your voicemail, calling back now."
  }'
```

## Response Example

```json
{
  "message": {
    "id": "msg_xyz789",
    "conversationId": "conv_abc123",
    "type": "TYPE_SMS",
    "direction": "inbound",
    "status": "delivered",
    "body": "I received your voicemail, calling back now.",
    "dateAdded": "2026-04-04T10:00:00.000Z"
  },
  "conversationId": "conv_abc123",
  "messageId": "msg_xyz789"
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad request -- missing required fields |
| 401 | Unauthorized -- invalid or expired token |
| 404 | Conversation not found |

## Common Use Cases

Log messages from an external phone system (e.g., RingCentral, Vonage) into HighLevel so the conversation thread stays complete. Sync messages from a custom chat widget into HL.

## Gotchas

- This does NOT actually send a message to anyone. It creates a record of an inbound message that already happened outside HighLevel.
- The `conversationProviderId` is your external system's conversation identifier. It is required for HL to track the external thread mapping.
- Use `altId` for deduplication -- if the same `altId` is sent twice, the second call may be ignored.
