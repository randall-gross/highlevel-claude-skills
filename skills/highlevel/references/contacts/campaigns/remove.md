# Remove Contact from Campaign

- **Method:** DELETE
- **Path:** `/contacts/{contactId}/campaigns/{campaignId}`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `contactId` | string | Yes | The ID of the contact |
| `campaignId` | string | Yes | The ID of the campaign to remove the contact from |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/campaigns/camp_7kLmNpQ2rS4u' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "succeeded": true
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid contactId or campaignId |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — contact or campaign does not exist |

## Common Use Cases
Remove a contact from a campaign when they convert, unsubscribe, or when the campaign is no longer relevant.

## Gotchas
- If the contact is not in the campaign, this may return a 404 or succeed silently depending on the HL version.
- Removing from a campaign stops future messages but does not undo messages already sent.
- For removing from all campaigns at once, use the `remove-all` endpoint.
