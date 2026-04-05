# List Surveys

- **Method:** GET
- **Path:** `/surveys/`
- **Scopes:** `surveys.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `limit` | integer | No | Number of results per page (default 20) |
| `skip` | integer | No | Number of results to skip for pagination |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/surveys/?locationId=ve9EPM428h8vShlRW1KT&limit=20' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "surveys": [
    {
      "id": "survey_abc123",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "name": "New Client Qualification Survey",
      "createdAt": "2024-04-10T10:00:00.000Z"
    },
    {
      "id": "survey_def456",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "name": "Customer Satisfaction Survey",
      "createdAt": "2024-05-20T14:00:00.000Z"
    }
  ],
  "total": 2
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
List all surveys in a location for a reporting dashboard. Find a survey ID to query its submissions.

## Gotchas
The response includes survey metadata only, not the questions or structure. There is no API to create or modify surveys — that must be done in the HL UI.
