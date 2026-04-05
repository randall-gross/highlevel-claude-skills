# Delete Business

- **Method:** DELETE
- **Path:** `/businesses/{businessId}`
- **Scopes:** `businesses.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `businessId` | string | Yes | The business ID to delete |

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/businesses/biz_def456' \
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
| 404 | Not Found — business ID does not exist |

## Common Use Cases
Remove a business that was created in error. Clean up test data.

## Gotchas
Deleting a business does NOT remove the business association from contacts that reference it. Those contacts will have a stale business reference.
