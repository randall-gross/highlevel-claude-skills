# Create Conversation

- **Method:** POST
- **Path:** `/conversations/`
- **Scopes:** `conversations.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |
| `contactId` | string | Yes | The contact ID |
| `type` | string | Yes | `TYPE_SMS`, `TYPE_EMAIL`, or `TYPE_LIVE_CHAT` |

## Request Example

```bash
curl --request POST \
  --url https://services.leadconnectorhq.com/conversations/ \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "type": "TYPE_SMS"
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
    "starred": false,
    "inbox": true,
    "deleted": false,
    "dateAdded": "2026-04-04T10:00:00.000Z",
    "dateUpdated": "2026-04-04T10:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad request -- missing required fields or invalid type |
| 401 | Unauthorized -- invalid or expired token |
| 422 | Unprocessable -- contact or location not found |

## Common Use Cases

Create a conversation before sending the first message on a new channel. Required when programmatically initiating outreach to a contact who has no prior conversation on that channel.

## Gotchas

- If a conversation already exists for the same contact + location + type combo, the API may return the existing conversation instead of creating a duplicate. Always check the response ID.
- The `type` value uses the `TYPE_` prefix (e.g., `TYPE_SMS`, not `SMS`).
