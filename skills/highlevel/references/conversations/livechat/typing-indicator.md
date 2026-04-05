# Send Typing Indicator

- **Method:** POST
- **Path:** `/conversations/providers/live-chat/typing`
- **Scopes:** `conversations/livechat.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `conversationId` | string | Yes | The live chat conversation ID |
| `isTyping` | boolean | Yes | `true` to show typing, `false` to hide |
| `locationId` | string | Yes | The location ID |

## Request Example

```bash
curl --request POST \
  --url https://services.leadconnectorhq.com/conversations/providers/live-chat/typing \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "conversationId": "conv_abc123",
    "isTyping": true,
    "locationId": "ve9EPM428h8vShlRW1KT"
  }'
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
| 400 | Bad request -- missing required fields or conversation is not live chat |
| 401 | Unauthorized -- invalid or expired token |
| 404 | Conversation not found |

## Common Use Cases

Show a "typing..." indicator in the live chat widget when a bot or agent is composing a response. Improve the user experience by signaling that a reply is incoming, especially when using AI to generate responses.

## Gotchas

- Only works for `TYPE_LIVE_CHAT` conversations. Sending this for an SMS or email conversation has no effect or returns an error.
- The typing indicator auto-expires after a few seconds. If your bot takes longer to respond, send `isTyping: true` periodically to keep the indicator visible.
- You must send `isTyping: false` explicitly when done typing, or wait for the auto-expiration. Sending the actual message does NOT automatically clear the typing indicator.
- This is a visual-only signal to the chat widget. It does not affect the conversation record or messages.
