# Upsert Contact

- **Method:** POST
- **Path:** `/contacts/upsert`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `firstName` | string | No | Contact's first name |
| `lastName` | string | No | Contact's last name |
| `email` | string | No | Contact's email (used for dedup matching) |
| `phone` | string | No | Contact's phone (used for dedup matching) |
| `companyName` | string | No | Company name |
| `tags` | string[] | No | Tags to add (ADDITIVE, not replacement) |
| `source` | string | No | Lead source |
| `customFields` | object[] | No | Array of `{ "id": "fieldId", "value": "value" }` |
| `address1` | string | No | Street address |
| `city` | string | No | City |
| `state` | string | No | State/province |
| `postalCode` | string | No | ZIP/postal code |
| `country` | string | No | Country |
| `website` | string | No | Website URL |
| `timezone` | string | No | IANA timezone string |
| `assignedTo` | string | No | User ID to assign contact to |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/contacts/upsert' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "firstName": "John",
    "lastName": "Doe",
    "email": "john.doe@example.com",
    "phone": "+14155551234",
    "tags": ["website-lead", "q1-2024"],
    "source": "landing page",
    "customFields": [
      { "id": "cF1pBhLeCkV49ISmpKBl", "value": "Premium" }
    ]
  }'
```

## Response Example

```json
{
  "contact": {
    "id": "nmFmQEsNgz6AVpgLVUJ0",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "firstName": "John",
    "lastName": "Doe",
    "email": "john.doe@example.com",
    "phone": "+14155551234",
    "tags": ["vip", "referral", "website-lead", "q1-2024"],
    "source": "landing page",
    "dateAdded": "2024-01-15T10:30:00.000Z",
    "dateUpdated": "2024-03-01T12:00:00.000Z"
  },
  "new": false
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId or no email/phone provided |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
This is the **recommended endpoint for all lead forms and integrations**. It creates new contacts or updates existing ones without creating duplicates. The `new` boolean in the response tells you if a new contact was created.

## Gotchas
- **Tags are ADDITIVE on upsert**, unlike the `update` endpoint where tags REPLACE. If the contact has `["vip"]` and you upsert with `["website-lead"]`, the result is `["vip", "website-lead"]`.
- Matching is done by email first, then phone. If both are provided and they match different contacts, email takes priority.
- You must provide at least one of `email` or `phone` for the dedup match to work. If neither is provided, a new contact is always created.
- The `new` field in the response is `true` when a new contact was created, `false` when an existing contact was updated.
