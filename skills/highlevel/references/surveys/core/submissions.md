# Get Survey Submissions

- **Method:** GET
- **Path:** `/surveys/submissions`
- **Scopes:** `surveys.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `surveyId` | string | No | Filter by specific survey ID |
| `limit` | integer | No | Number of results per page (default 20) |
| `page` | integer | No | Page number (1-based) |
| `startAt` | string | No | Filter submissions after this ISO date |
| `endAt` | string | No | Filter submissions before this ISO date |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/surveys/submissions?locationId=ve9EPM428h8vShlRW1KT&surveyId=survey_abc123&limit=10&page=1' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "submissions": [
    {
      "id": "sub_survey_001",
      "surveyId": "survey_abc123",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "contactId": "nmFmQEsNgz6AVpgLVUJ0",
      "name": "John Doe",
      "email": "john.doe@example.com",
      "others": {
        "What service are you interested in?": "Frameless Shower Doors",
        "What is your budget range?": "$2,000 - $5,000",
        "When do you need the work done?": "Within 30 days"
      },
      "createdAt": "2024-06-20T11:00:00.000Z"
    }
  ],
  "meta": {
    "total": 12,
    "currentPage": 1,
    "nextPage": 2
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Export survey results for analysis. Build a lead qualification dashboard based on survey answers. Generate client reports showing survey completion rates.

## Gotchas
The `others` object uses question text as keys, not field IDs — keys can be long and contain special characters. Without `surveyId`, returns submissions from ALL surveys. Pagination is 1-based. The API structure mirrors the Forms submissions endpoint almost exactly.
