# Update Conversation

- **Method:** PUT
- **Path:** `/conversations/{conversationId}`
- **Scopes:** `conversations.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `conversationId` | string | Yes | The conversation ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `starred` | boolean | No | Star or unstar the conversation |
| `unreadCount` | number | No | Set unread count (use 0 to mark as read) |
| `assignedTo` | string | No | HighLevel user ID to assign conversation to |

## Request Example

```bash
curl --request PUT \
  --url https://services.leadconnectorhq.com/conversations/conv_abc123 \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "starred": true,
    "unreadCount": 0
  }'
```

## Response Example

```json
{
  "conversation": {
    "id": "conv_abc123",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "type": "TYPE_SMS",
    "unreadCount": 0,
    "starred": true,
    "inbox": true,
    "deleted": false,
    "assignedTo": "user_abc123",
    "dateUpdated": "2026-04-04T10:05:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad request -- invalid field values |
| 401 | Unauthorized -- invalid or expired token |
| 404 | Conversation not found |

## Common Use Cases

Mark a conversation as read after displaying it to a user. Star important conversations for follow-up. Reassign conversations between team members.

## Gotchas

- Setting `unreadCount` to 0 marks the conversation as read. There is no separate "mark as read" endpoint.
- You cannot change the `type` or `contactId` of an existing conversation.
