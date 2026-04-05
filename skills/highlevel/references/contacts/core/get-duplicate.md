# Get Duplicate Contact

- **Method:** GET
- **Path:** `/contacts/search/duplicate`
- **Scopes:** `contacts.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `email` | string | No | Email to check for duplicates |
| `phone` | string | No | Phone to check for duplicates |

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/contacts/search/duplicate?locationId=ve9EPM428h8vShlRW1KT&email=john.doe@example.com' \
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
    "phone": "+14155551234"
  }
}
```

When no duplicate is found:

```json
{
  "contact": null
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId or neither email nor phone provided |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Check if a contact already exists before creating one, or validate uniqueness in a custom form submission handler. Useful as a pre-check before `create` if you need more control than `upsert` provides.

## Gotchas
- You must provide at least one of `email` or `phone`. Providing neither returns a 400 error.
- If both `email` and `phone` are provided, it matches on email first.
- Returns only the first matching contact, even if multiple duplicates exist.
- For most use cases, `upsert` is simpler than checking for duplicates then conditionally creating/updating.
