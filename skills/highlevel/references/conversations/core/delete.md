# Delete Conversation

- **Method:** DELETE
- **Path:** `/conversations/{conversationId}`
- **Scopes:** `conversations.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `conversationId` | string | Yes | The conversation ID |

## Request Example

```bash
curl --request DELETE \
  --url https://services.leadconnectorhq.com/conversations/conv_abc123 \
  --header 'Authorization: Bearer TOKEN' \
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
| 400 | Bad request -- invalid conversation ID format |
| 401 | Unauthorized -- invalid or expired token |
| 404 | Conversation not found |

## Common Use Cases

Clean up test conversations or remove spam threads from the inbox.

## Gotchas

- Deleting a conversation does NOT delete the associated contact. The contact remains intact.
- Deleted conversations may still appear in search results briefly due to eventual consistency. The `deleted` flag will be `true`.
- Messages within the conversation are also removed. This is not reversible.
