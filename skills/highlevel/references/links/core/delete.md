# Delete Trigger Link

- **Method:** DELETE
- **Path:** `/links/{linkId}`
- **Scopes:** `links.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `linkId` | string | Yes | The trigger link ID |

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/links/link_def456' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
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
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — link ID does not exist |

## Common Use Cases
Remove expired campaign links. Clean up test trigger links.

## Gotchas
Deleting a trigger link makes all previously shared URLs for that link non-functional — contacts clicking the old URL will get an error. Any workflows using this link as a trigger will stop firing.
