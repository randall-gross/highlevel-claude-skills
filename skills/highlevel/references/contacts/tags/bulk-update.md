# Bulk Update Tags

- **Method:** POST
- **Path:** `/contacts/bulk/tags/update/{type}`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `type` | string | Yes | Operation type: `add` or `remove` |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `contactIds` | string[] | Yes | Array of contact IDs to update |
| `tags` | string[] | Yes | Array of tag names to add or remove |
| `locationId` | string | Yes | The sub-account ID |

## Request Example

### Add tags to multiple contacts
```bash
curl -X POST \
  'https://services.leadconnectorhq.com/contacts/bulk/tags/update/add' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "contactIds": ["nmFmQEsNgz6AVpgLVUJ0", "pQr3sTuVwXyZ1234abcd", "aB3cDeF4gH5iJkLmN6oP"],
    "tags": ["q1-campaign", "email-blast"]
  }'
```

### Remove tags from multiple contacts
```bash
curl -X POST \
  'https://services.leadconnectorhq.com/contacts/bulk/tags/update/remove' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "contactIds": ["nmFmQEsNgz6AVpgLVUJ0", "pQr3sTuVwXyZ1234abcd"],
    "tags": ["old-campaign"]
  }'
```

## Response Example

```json
{
  "succeeded": true,
  "ids": ["nmFmQEsNgz6AVpgLVUJ0", "pQr3sTuVwXyZ1234abcd", "aB3cDeF4gH5iJkLmN6oP"]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid type parameter, missing contactIds, or missing tags |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — one or more contactIds do not exist |

## Common Use Cases
Apply or remove campaign tags across a segment of contacts, such as tagging all attendees of an event or cleaning up after a marketing campaign.

## Gotchas
- The `type` path parameter must be exactly `add` or `remove`. Any other value returns a 400.
- There is a practical limit of ~500 contact IDs per request. For larger batches, split into multiple requests.
- This is an async-style operation. The response confirms acceptance but processing may take a few seconds for large batches.
- Tags are case-sensitive. Ensure consistent casing across your application.
