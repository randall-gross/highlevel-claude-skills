# Get Trigger Link

- **Method:** GET
- **Path:** `/links/id/{linkId}`
- **Scopes:** `links.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `linkId` | string | Yes | The trigger link ID |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/links/id/link_abc123' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "id": "link_abc123",
  "locationId": "ve9EPM428h8vShlRW1KT",
  "name": "Free Quote CTA",
  "redirectTo": "https://allstarshowerdoors.com/thank-you",
  "fieldKey": "contact.interested_in",
  "fieldValue": "free_quote",
  "createdAt": "2024-05-10T10:00:00.000Z",
  "updatedAt": "2024-05-10T10:00:00.000Z"
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — link ID does not exist |

## Common Use Cases
Fetch a specific trigger link's configuration to verify its redirect URL and field mapping.

## Gotchas
Note the path includes `/id/` before the linkId — this is different from most HL endpoints that use just `/{resourceId}`.
