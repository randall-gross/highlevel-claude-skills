# Create Trigger Link

- **Method:** POST
- **Path:** `/links/`
- **Scopes:** `links.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `name` | string | Yes | Display name for the link |
| `redirectTo` | string | Yes | Destination URL after click |
| `fieldKey` | string | No | Contact field key to update on click |
| `fieldValue` | string | No | Value to set on the contact field |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/links/' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Book Consultation CTA",
    "redirectTo": "https://allstarshowerdoors.com/book",
    "fieldKey": "contact.last_cta_clicked",
    "fieldValue": "book_consultation"
  }'
```

## Response Example

```json
{
  "id": "link_ghi789",
  "locationId": "ve9EPM428h8vShlRW1KT",
  "name": "Book Consultation CTA",
  "redirectTo": "https://allstarshowerdoors.com/book",
  "fieldKey": "contact.last_cta_clicked",
  "fieldValue": "book_consultation",
  "createdAt": "2024-07-01T12:00:00.000Z"
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — invalid redirectTo URL or fieldKey |

## Common Use Cases
Create trackable links for email campaigns. Set up CTA tracking that automatically tags contacts based on which link they clicked.

## Gotchas
The `fieldKey` must be a valid contact field key (use the Custom Fields API to find valid keys). If `fieldKey` is set, `fieldValue` should also be set, otherwise the field gets cleared on click. The `redirectTo` URL must be a valid absolute URL.
