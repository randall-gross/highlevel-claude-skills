# Add Contact to Campaign

- **Method:** POST
- **Path:** `/contacts/{contactId}/campaigns/{campaignId}`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `contactId` | string | Yes | The ID of the contact |
| `campaignId` | string | Yes | The ID of the campaign to add the contact to |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X POST \
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
| 422 | Unprocessable Entity — contact is already in the campaign |

## Common Use Cases
Enroll a contact in a drip campaign or email sequence after they take a specific action (form submission, tag added, etc.).

## Gotchas
- Campaigns are the legacy HL drip system. For newer accounts, workflows have largely replaced campaigns. Check which system the sub-account uses.
- Adding a contact to a campaign they are already in returns a 422.
- The contact starts at step 1 of the campaign. There is no way to specify a starting step via the API.
- If the contact has DND enabled for the campaign's channel (email/SMS), they will be enrolled but won't receive messages.
