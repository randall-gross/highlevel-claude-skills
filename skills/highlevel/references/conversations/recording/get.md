# Get Call Recording

- **Method:** GET
- **Path:** `/conversations/messages/{messageId}/locations/{locationId}/recording`
- **Scopes:** `conversations/message.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `messageId` | string | Yes | The call message ID |
| `locationId` | string | Yes | The location ID |

## Request Example

```bash
curl --request GET \
  --url https://services.leadconnectorhq.com/conversations/messages/msg_xyz789/locations/ve9EPM428h8vShlRW1KT/recording \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "url": "https://storage.leadconnectorhq.com/location/ve9EPM428h8vShlRW1KT/recordings/msg_xyz789.mp3",
  "contentType": "audio/mpeg",
  "duration": 245,
  "dateAdded": "2026-04-01T10:30:00.000Z"
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad request -- message is not a call type |
| 401 | Unauthorized -- invalid or expired token |
| 404 | Recording not found or call recording not enabled |

## Common Use Cases

Retrieve call recordings for quality assurance review. Build a custom call log with playback functionality. Archive recordings externally.

## Gotchas

- The message must be a call type (`TYPE_CALL` or `TYPE_PHONE`). Using an SMS or email message ID returns 404.
- Call recording must be enabled for the location's phone number. If recording is disabled, no recording exists even for completed calls.
- The `locationId` in the path must match the location the call belongs to. Mismatched IDs return 404.
- The returned URL may be a signed/temporary URL with an expiration. Download promptly if archiving.
