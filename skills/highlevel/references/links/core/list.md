# List Trigger Links

- **Method:** GET
- **Path:** `/links/`
- **Scopes:** `links.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/links/?locationId=ve9EPM428h8vShlRW1KT' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "links": [
    {
      "id": "link_abc123",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "name": "Free Quote CTA",
      "redirectTo": "https://allstarshowerdoors.com/thank-you",
      "fieldKey": "contact.interested_in",
      "fieldValue": "free_quote",
      "createdAt": "2024-05-10T10:00:00.000Z"
    },
    {
      "id": "link_def456",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "name": "Summer Promo Click",
      "redirectTo": "https://allstarshowerdoors.com/summer-special",
      "fieldKey": null,
      "fieldValue": null,
      "createdAt": "2024-06-01T08:00:00.000Z"
    }
  ]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
View all trigger links for a location. Build a link management dashboard.

## Gotchas
No pagination — returns all links for the location. For locations with many trigger links, consider using the search endpoint instead.
