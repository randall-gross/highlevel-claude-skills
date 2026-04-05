# Get Conversation

- **Method:** GET
- **Path:** `/conversations/{conversationId}`
- **Scopes:** `conversations.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `conversationId` | string | Yes | The conversation ID |

## Request Example

```bash
curl --request GET \
  --url https://services.leadconnectorhq.com/conversations/conv_abc123 \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "conversation": {
    "id": "conv_abc123",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "type": "TYPE_SMS",
    "unreadCount": 2,
    "starred": false,
    "inbox": true,
    "deleted": false,
    "assignedTo": "user_abc123",
    "lastMessageBody": "Thanks for reaching out!",
    "lastMessageDate": "2026-04-01T12:00:00.000Z",
    "lastMessageType": "TYPE_SMS",
    "lastMessageDirection": "outbound",
    "dateAdded": "2026-03-15T08:30:00.000Z",
    "dateUpdated": "2026-04-01T12:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad request -- invalid conversation ID format |
| 401 | Unauthorized -- invalid or expired token |
| 404 | Conversation not found |

## Common Use Cases

Load conversation details before displaying a message thread in a custom CRM view. Check `unreadCount` and `assignedTo` for routing logic.

## Gotchas

- The `type` field reflects the channel the conversation was created on, not the last message type. A conversation created as `TYPE_SMS` stays `TYPE_SMS` even if an email is sent to the same contact.
