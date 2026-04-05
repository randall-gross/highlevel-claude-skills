# Create Contact

- **Method:** POST
- **Path:** `/contacts/`
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
| `email` | string | No | Contact's email address |
| `phone` | string | No | Contact's phone number (E.164 format recommended) |
| `companyName` | string | No | Company or business name |
| `tags` | string[] | No | Array of tag names to apply |
| `source` | string | No | Lead source (e.g., "website form", "referral") |
| `customFields` | object[] | No | Array of `{ "id": "fieldId", "value": "value" }` |
| `address1` | string | No | Street address |
| `city` | string | No | City |
| `state` | string | No | State/province |
| `postalCode` | string | No | ZIP/postal code |
| `country` | string | No | Country |
| `website` | string | No | Website URL |
| `timezone` | string | No | IANA timezone string |
| `dnd` | boolean | No | Do Not Disturb flag |
| `assignedTo` | string | No | User ID to assign the contact to |
| `gender` | string | No | Contact's gender |
| `dateOfBirth` | string | No | Date of birth (YYYY-MM-DD) |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/contacts/' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "firstName": "Jane",
    "lastName": "Smith",
    "email": "jane.smith@example.com",
    "phone": "+14085559876",
    "companyName": "Smith Industries",
    "tags": ["new-lead", "website"],
    "source": "contact form",
    "customFields": [
      { "id": "cF1pBhLeCkV49ISmpKBl", "value": "Standard" }
    ]
  }'
```

## Response Example

```json
{
  "contact": {
    "id": "kT9mNpQ2rS4uVwXyZ1ab",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "firstName": "Jane",
    "lastName": "Smith",
    "email": "jane.smith@example.com",
    "phone": "+14085559876",
    "companyName": "Smith Industries",
    "tags": ["new-lead", "website"],
    "source": "contact form",
    "dateAdded": "2024-03-01T12:00:00.000Z",
    "dateUpdated": "2024-03-01T12:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId or invalid field format |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — duplicate contact exists (use upsert instead) |

## Common Use Cases
Create a new contact from an external system integration or import process. For lead forms, prefer `upsert` to avoid duplicates.

## Gotchas
- **Use upsert instead for lead forms.** Create will fail with 422 if a contact with the same email or phone already exists in the location. Upsert handles deduplication automatically.
- Custom fields require the field ID, not the field name. Query the custom fields endpoint first to get IDs.
- Phone numbers should be in E.164 format (`+1XXXXXXXXXX`). HL will attempt to normalize other formats but results vary.
