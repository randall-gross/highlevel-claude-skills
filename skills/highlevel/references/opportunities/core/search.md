# Search Opportunities

- **Method:** GET
- **Path:** `/opportunities/search`
- **Scopes:** `opportunities.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `location_id` | string | Yes | The sub-account ID |
| `pipeline_id` | string | No | Filter by pipeline |
| `pipeline_stage_id` | string | No | Filter by pipeline stage |
| `contact_id` | string | No | Filter by contact |
| `status` | string | No | Filter by status: `"open"`, `"won"`, `"lost"`, `"abandoned"` |
| `assigned_to` | string | No | Filter by assigned user ID |
| `q` | string | No | Search term (matches opportunity name) |
| `limit` | number | No | Number of results per page (default: 20, max: 100) |
| `startAfter` | string | No | Cursor timestamp for pagination (ISO 8601) |
| `startAfterId` | string | No | Cursor opportunity ID for pagination |

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/opportunities/search?location_id=ve9EPM428h8vShlRW1KT&pipeline_id=bCkKGpDsyPP4peuKowkG&status=open&limit=20' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "opportunities": [
    {
      "id": "opp_xyz789",
      "name": "Website Redesign Project",
      "monetaryValue": 7500,
      "pipelineId": "bCkKGpDsyPP4peuKowkG",
      "pipelineStageId": "stage_abc123",
      "assignedTo": "uKxMbLQ9f3cR7oPdWlNe",
      "status": "open",
      "source": "website form",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "contactId": "nmFmQEsNgz6AVpgLVUJ0",
      "contact": {
        "id": "nmFmQEsNgz6AVpgLVUJ0",
        "name": "John Doe",
        "email": "john.doe@example.com"
      },
      "createdAt": "2024-01-10T08:00:00.000Z",
      "updatedAt": "2024-02-15T10:30:00.000Z"
    },
    {
      "id": "opp_abc456",
      "name": "SEO Retainer",
      "monetaryValue": 2500,
      "pipelineId": "bCkKGpDsyPP4peuKowkG",
      "pipelineStageId": "stage_abc123",
      "assignedTo": "uKxMbLQ9f3cR7oPdWlNe",
      "status": "open",
      "source": "referral",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "contactId": "kT9mNpQ2rS4uVwXyZ1ab",
      "contact": {
        "id": "kT9mNpQ2rS4uVwXyZ1ab",
        "name": "Jane Smith",
        "email": "jane.smith@example.com"
      },
      "createdAt": "2024-02-01T09:00:00.000Z",
      "updatedAt": "2024-02-20T11:45:00.000Z"
    }
  ],
  "meta": {
    "total": 47,
    "nextPageUrl": "https://services.leadconnectorhq.com/opportunities/search?location_id=ve9EPM428h8vShlRW1KT&pipeline_id=bCkKGpDsyPP4peuKowkG&status=open&limit=20&startAfter=2024-02-01T09:00:00.000Z&startAfterId=opp_abc456",
    "startAfter": "2024-02-01T09:00:00.000Z",
    "startAfterId": "opp_abc456"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing location_id or invalid parameter format |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Build pipeline board views showing deals by stage, generate reports of won deals in a date range, or find all opportunities assigned to a specific team member.

## Gotchas
- **Query params use snake_case** (`location_id`, `pipeline_id`), not camelCase. This is inconsistent with most other HL endpoints.
- This is a GET request with query parameters, NOT a POST with a request body like contacts search.
- Pagination uses cursor-based pagination with `startAfter` (timestamp) and `startAfterId` (opportunity ID). Both must be provided together for the next page.
- The `q` parameter does a partial match on the opportunity name only, not on contact name or other fields.
- Results are sorted by creation date descending (newest first).
