# Remove Tags from Contact

- **Method:** DELETE
- **Path:** `/contacts/{contactId}/tags`
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
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `tags` | string[] | Yes | Array of tag names to remove |

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/tags' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "tags": ["old-tag"]
  }'
```

## Response Example

```json
{
  "tags": ["vip", "referral"]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing tags array or empty array |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — contact does not exist |

## Common Use Cases
Remove outdated or incorrect tags from a contact, such as cleaning up campaign-specific tags after a campaign ends.

## Gotchas
- If a tag in the array does not exist on the contact, it is silently ignored (no error).
- Tags are case-sensitive. `"VIP"` will not remove `"vip"`.
- This is a DELETE method but still requires a JSON body. Some HTTP clients don't support bodies on DELETE — you may need to configure that explicitly.
