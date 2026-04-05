# Add Outbound Call Record

- **Method:** POST
- **Path:** `/conversations/messages/outbound`
- **Scopes:** `conversations/message.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `type` | string | Yes | `Call` |
| `conversationId` | string | Yes | The conversation ID |
| `conversationProviderId` | string | Yes | External provider conversation ID |
| `message` | string | No | Call notes or summary |
| `attachments` | string[] | No | Array of attachment URLs (e.g., recording URL) |
| `altId` | string | No | External call ID for deduplication |

## Request Example

```bash
curl --request POST \
  --url https://services.leadconnectorhq.com/conversations/messages/outbound \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "type": "Call",
    "conversationId": "conv_abc123",
    "conversationProviderId": "ext_provider_123",
    "message": "Discussed project timeline. Follow-up scheduled for Friday."
  }'
```

## Response Example

```json
{
  "message": {
    "id": "msg_xyz789",
    "conversationId": "conv_abc123",
    "type": "TYPE_CALL",
    "direction": "outbound",
    "status": "completed",
    "body": "Discussed project timeline. Follow-up scheduled for Friday.",
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

Log outbound calls from an external phone system (VoIP, PBX) into HighLevel. Attach call recordings or notes to keep the conversation history complete.

## Gotchas

- Like the inbound endpoint, this does NOT place a phone call. It only creates a record of a call that already happened.
- The `type` should be `Call` for phone call records.
- The `message` field is used for call notes/summary, not a transcript. Use the transcription endpoints for full transcripts.
