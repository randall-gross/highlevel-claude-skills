# Remove Contact from All Campaigns

- **Method:** DELETE
- **Path:** `/contacts/{contactId}/campaigns/removeAll`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `contactId` | string | Yes | The ID of the contact |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/campaigns/removeAll' \
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
| 400 | Bad Request — invalid contactId format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — contact does not exist |

## Common Use Cases
Stop all campaign communications for a contact at once, such as when a contact requests to be removed from all marketing or when they convert and should no longer receive nurture sequences.

## Gotchas
- This is a nuclear option. It removes the contact from EVERY active campaign, not just one.
- There is no undo. Re-adding the contact to a campaign starts them at step 1 again.
- This does not affect workflows, only legacy campaigns.
