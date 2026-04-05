# Get Contact

- **Method:** GET
- **Path:** `/contacts/{contactId}`
- **Scopes:** `contacts.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `contactId` | string | Yes | The ID of the contact to retrieve |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
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
    "companyName": "Acme Corp",
    "tags": ["vip", "referral"],
    "source": "website form",
    "customFields": [
      {
        "id": "cF1pBhLeCkV49ISmpKBl",
        "value": "Premium"
      }
    ],
    "dateAdded": "2024-01-15T10:30:00.000Z",
    "dateUpdated": "2024-02-20T14:22:00.000Z",
    "dateOfBirth": "1990-05-15",
    "address1": "123 Main St",
    "city": "Atlanta",
    "state": "GA",
    "postalCode": "30301",
    "website": "https://acmecorp.com",
    "timezone": "America/New_York",
    "dnd": false,
    "assignedTo": "uKxMbLQ9f3cR7oPdWlNe"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid contactId format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — contact does not exist or belongs to a different location |

## Common Use Cases
Retrieve full contact details before displaying a contact profile or before updating a contact record.

## Gotchas
- Custom fields are returned with their field ID, not field name. You need the custom fields list to map IDs to human-readable names.
- The `dnd` field is a boolean summary. Use the DND endpoints for granular channel-level DND status.
