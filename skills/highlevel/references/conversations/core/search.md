# Search Conversations

- **Method:** GET
- **Path:** `/conversations/search`
- **Scopes:** `conversations.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |
| `contactId` | string | No | Filter by contact ID |
| `assignedTo` | string | No | Filter by assigned user ID |
| `q` | string | No | Search query (searches message body) |
| `status` | string | No | Filter: `all`, `read`, `unread`, `starred` |
| `limit` | number | No | Results per page (default 20, max 100) |
| `startAfterDate` | string | No | ISO 8601 date -- return conversations updated after this date |
| `id` | string | No | Cursor ID for pagination (from previous response) |
| `sort` | string | No | Sort field (default: `lastMessageDate`) |
| `sortDirection` | string | No | `asc` or `desc` (default: `desc`) |

## Request Example

```bash
curl --request GET \
  --url 'https://services.leadconnectorhq.com/conversations/search?locationId=ve9EPM428h8vShlRW1KT&status=unread&limit=20' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "conversations": [
    {
      "id": "conv_abc123",
      "contactId": "nmFmQEsNgz6AVpgLVUJ0",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "type": "TYPE_SMS",
      "unreadCount": 3,
      "starred": false,
      "inbox": true,
      "deleted": false,
      "assignedTo": "user_abc123",
      "lastMessageBody": "When is my appointment?",
      "lastMessageDate": "2026-04-03T14:30:00.000Z",
      "lastMessageType": "TYPE_SMS",
      "lastMessageDirection": "inbound",
      "contactName": "John Doe",
      "contactEmail": "john@example.com",
      "contactPhone": "+15551234567"
    }
  ],
  "total": 45
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad request -- missing locationId or invalid parameters |
| 401 | Unauthorized -- invalid or expired token |

## Common Use Cases

Build a custom inbox view showing unread conversations assigned to a specific team member. Power search-as-you-type in a CRM conversation list. Paginate through all conversations for a location.

## Gotchas

- `locationId` is required -- you cannot search across all locations in one call.
- The `q` parameter searches message body text, not contact name. To find conversations by contact name, search contacts first, then filter by `contactId`.
- Pagination uses cursor-based approach: pass the last conversation's `id` as the `id` query parameter for the next page, not a page number.
- `startAfterDate` filters on `lastMessageDate`, not `dateAdded`. Use this for incremental syncs.
