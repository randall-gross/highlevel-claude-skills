# Add Tags to Contact

- **Method:** POST
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
| `tags` | string[] | Yes | Array of tag names to add |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/tags' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "tags": ["vip", "referral"]
  }'
```

## Response Example

```json
{
  "tags": ["existing-tag", "vip", "referral"]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing tags array or empty array |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — contact does not exist |

## Common Use Cases
Add tags to a contact after a specific action (form submission, purchase, workflow trigger) without affecting existing tags.

## Gotchas
- Tags are **additive**. Existing tags are preserved, and the new tags are appended.
- If a tag already exists on the contact, it is silently ignored (no error, no duplicate).
- Tags are plain strings, not IDs. They are case-sensitive — `"VIP"` and `"vip"` are treated as different tags.
- Use this instead of the `update` endpoint when you want to add tags without replacing the full tag list.
