# Update Contact

- **Method:** PUT
- **Path:** `/contacts/{contactId}`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `contactId` | string | Yes | The ID of the contact to update |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `firstName` | string | No | Contact's first name |
| `lastName` | string | No | Contact's last name |
| `email` | string | No | Contact's email address |
| `phone` | string | No | Contact's phone number |
| `companyName` | string | No | Company name |
| `tags` | string[] | No | **WARNING:** REPLACES all existing tags |
| `customFields` | object[] | No | Array of `{ "id": "fieldId", "value": "value" }` |
| `address1` | string | No | Street address |
| `city` | string | No | City |
| `state` | string | No | State/province |
| `postalCode` | string | No | ZIP/postal code |
| `country` | string | No | Country |
| `website` | string | No | Website URL |
| `timezone` | string | No | IANA timezone string |
| `dnd` | boolean | No | Do Not Disturb flag |
| `assignedTo` | string | No | User ID to assign contact to |
| `source` | string | No | Lead source |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "firstName": "John",
    "lastName": "Doe-Smith",
    "companyName": "Acme Corp International",
    "customFields": [
      { "id": "cF1pBhLeCkV49ISmpKBl", "value": "Enterprise" }
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
    "lastName": "Doe-Smith",
    "email": "john.doe@example.com",
    "phone": "+14155551234",
    "companyName": "Acme Corp International",
    "tags": ["vip", "referral"],
    "dateUpdated": "2024-03-05T09:45:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid field format or contactId |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — contact does not exist |
| 422 | Unprocessable Entity — email/phone conflicts with another contact |

## Common Use Cases
Update contact details after a form submission, CRM sync, or manual edit in a custom UI.

## Gotchas
- **Tags in the body REPLACE all existing tags.** If the contact has `["vip", "referral"]` and you send `{ "tags": ["premium"] }`, the contact will only have `["premium"]`. To add tags without replacing, use the `tags/add` endpoint instead.
- Only include fields you want to change. Omitted fields are left unchanged.
- Custom fields are merged, not replaced. Sending one custom field does not clear others.
