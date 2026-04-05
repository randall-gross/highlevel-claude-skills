# Delete Sub-Account

- **Method:** DELETE
- **Path:** `/locations/{locationId}`
- **Scopes:** `locations.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `deleteTwilioAccount` | boolean | No | Whether to also delete the associated Twilio sub-account |

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT?deleteTwilioAccount=false' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28'
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
| 400 | Bad Request — invalid locationId |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — location does not exist |
| 422 | Unprocessable Entity — location cannot be deleted |

## Common Use Cases

Remove a sub-account when a client churns or during cleanup of test locations.

## Gotchas

- This is **irreversible**. All contacts, conversations, pipelines, and data within the location are permanently deleted.
- The `deleteTwilioAccount` parameter controls whether the linked Twilio sub-account is also removed. Defaults to false.
- This is an agency-level operation. Sub-account tokens cannot delete their own location.
