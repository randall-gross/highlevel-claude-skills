# Update Trigger Link

- **Method:** PUT
- **Path:** `/links/{linkId}`
- **Scopes:** `links.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `linkId` | string | Yes | The trigger link ID |

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `name` | string | No | Updated display name |
| `redirectTo` | string | No | Updated destination URL |
| `fieldKey` | string | No | Updated contact field key |
| `fieldValue` | string | No | Updated field value |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/links/link_abc123' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "name": "Free Quote CTA - Updated",
    "redirectTo": "https://allstarshowerdoors.com/free-quote-thank-you"
  }'
```

## Response Example

```json
{
  "id": "link_abc123",
  "locationId": "ve9EPM428h8vShlRW1KT",
  "name": "Free Quote CTA - Updated",
  "redirectTo": "https://allstarshowerdoors.com/free-quote-thank-you",
  "fieldKey": "contact.interested_in",
  "fieldValue": "free_quote"
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — link ID does not exist |
| 422 | Unprocessable Entity — invalid data |

## Common Use Cases
Update a redirect URL when a landing page changes. Modify the field mapping for campaign tracking.

## Gotchas
Note the update path uses `/links/{linkId}` directly (no `/id/` prefix like the GET endpoint). Partial updates are supported.
