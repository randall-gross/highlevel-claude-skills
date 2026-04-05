# List Messages

- **Method:** GET
- **Path:** `/conversations/{conversationId}/messages`
- **Scopes:** `conversations/message.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `conversationId` | string | Yes | The conversation ID |

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `limit` | number | No | Number of messages to return (default 20, max 100) |
| `type` | string | No | Filter by message type |
| `lastMessageId` | string | No | Cursor for pagination -- return messages before this ID |

## Request Example

```bash
curl --request GET \
  --url 'https://services.leadconnectorhq.com/conversations/conv_abc123/messages?limit=20' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "messages": {
    "messages": [
      {
        "id": "msg_xyz789",
        "conversationId": "conv_abc123",
        "contactId": "nmFmQEsNgz6AVpgLVUJ0",
        "locationId": "ve9EPM428h8vShlRW1KT",
        "type": "TYPE_SMS",
        "direction": "inbound",
        "status": "delivered",
        "body": "Hi, I'd like to schedule an appointment",
        "dateAdded": "2026-04-01T10:00:00.000Z",
        "attachments": []
      },
      {
        "id": "msg_xyz790",
        "conversationId": "conv_abc123",
        "contactId": "nmFmQEsNgz6AVpgLVUJ0",
        "locationId": "ve9EPM428h8vShlRW1KT",
        "type": "TYPE_SMS",
        "direction": "outbound",
        "status": "delivered",
        "body": "Sure! Here's our booking link: ...",
        "dateAdded": "2026-04-01T10:05:00.000Z",
        "attachments": []
      }
    ],
    "lastMessageId": "msg_xyz789"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad request -- invalid conversation ID |
| 401 | Unauthorized -- invalid or expired token |
| 404 | Conversation not found |

## Common Use Cases

Load the message history for a conversation thread in a custom inbox UI. Paginate through older messages as the user scrolls up.

## Gotchas

- Messages are returned in reverse chronological order (newest first). Use `lastMessageId` to paginate backward.
- The response has a nested `messages.messages` structure -- the outer key is `messages`, containing an object with a `messages` array and `lastMessageId`.
- Email messages returned here have truncated bodies. Use the `get-email` endpoint for full HTML content.
