# Bulk Business Assignment

- **Method:** POST
- **Path:** `/contacts/bulk/business`
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
| `contactIds` | string[] | Yes | Array of contact IDs to update |
| `businessId` | string | Yes | The business ID to link/unlink |
| `action` | string | Yes | `add` to link contacts or `remove` to unlink contacts |

## Request Example

### Add contacts to a business
```bash
curl -X POST \
  'https://services.leadconnectorhq.com/contacts/bulk/business' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "contactIds": ["nmFmQEsNgz6AVpgLVUJ0", "pQr3sTuVwXyZ1234abcd"],
    "businessId": "biz_7kLmNpQ2rS4u",
    "action": "add"
  }'
```

### Remove contacts from a business
```bash
curl -X POST \
  'https://services.leadconnectorhq.com/contacts/bulk/business' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "contactIds": ["nmFmQEsNgz6AVpgLVUJ0"],
    "businessId": "biz_7kLmNpQ2rS4u",
    "action": "remove"
  }'
```

## Response Example

```json
{
  "succeeded": true,
  "ids": ["nmFmQEsNgz6AVpgLVUJ0", "pQr3sTuVwXyZ1234abcd"]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing required fields or invalid action value |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — business does not exist |
| 422 | Unprocessable Entity — one or more contactIds are invalid |

## Common Use Cases
Associate multiple contacts with a business entity for B2B account management, or clean up business associations during data hygiene operations.

## Gotchas
- The `action` field must be exactly `add` or `remove`. Any other value returns a 400.
- A contact can be linked to multiple businesses simultaneously.
- This does not update the contact's `companyName` field. Business associations and `companyName` are separate concepts in HL.
- There is a practical limit of ~500 contact IDs per request.
