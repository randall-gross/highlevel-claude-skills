# Search Trigger Links

- **Method:** GET
- **Path:** `/links/search`
- **Scopes:** `links.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `query` | string | No | Search string to match against link names |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/links/search?locationId=ve9EPM428h8vShlRW1KT&query=quote' \
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
      "fieldValue": "free_quote"
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
Find a specific trigger link by name. Typeahead search when selecting a link to embed in an email template.

## Gotchas
The search is a fuzzy match on the `name` field only — it does not search redirect URLs or field values. Without a `query` parameter, it behaves like the list endpoint.
