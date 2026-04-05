# Get Contacts by Business

- **Method:** GET
- **Path:** `/contacts/business/{businessId}`
- **Scopes:** `contacts.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `businessId` | string | Yes | The business ID to get linked contacts for |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `limit` | integer | No | Number of results per page (default 20, max 100) |
| `skip` | integer | No | Number of records to skip for pagination |

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/contacts/business/biz_7kLmNpQ2rS4u?locationId=ve9EPM428h8vShlRW1KT&limit=20' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "contacts": [
    {
      "id": "nmFmQEsNgz6AVpgLVUJ0",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "firstName": "John",
      "lastName": "Doe",
      "email": "john.doe@example.com",
      "phone": "+14155551234",
      "companyName": "Acme Corp"
    },
    {
      "id": "aB3cDeF4gH5iJkLmN6oP",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "firstName": "Sarah",
      "lastName": "Connor",
      "email": "sarah.connor@acmecorp.com",
      "phone": "+14155555678",
      "companyName": "Acme Corp"
    }
  ],
  "total": 2
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId or invalid businessId |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — business does not exist |

## Common Use Cases
List all contacts associated with a specific business entity, useful for B2B CRM views or account-based marketing.

## Gotchas
- This endpoint uses offset-based pagination (`skip`), unlike the main list endpoint which uses cursor-based pagination.
- Contacts must be explicitly linked to a business via the business association endpoints. Having a matching `companyName` field alone does not count.
