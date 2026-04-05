# Create Opportunity

- **Method:** POST
- **Path:** `/opportunities/`
- **Scopes:** `opportunities.write`
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
| `pipelineId` | string | Yes | The pipeline to place the opportunity in |
| `locationId` | string | Yes | The sub-account ID |
| `name` | string | Yes | Name/title of the opportunity |
| `pipelineStageId` | string | Yes | The stage within the pipeline |
| `status` | string | Yes | One of: `"open"`, `"won"`, `"lost"`, `"abandoned"` |
| `contactId` | string | Yes | The contact linked to this opportunity |
| `monetaryValue` | number | No | Deal value in dollars (e.g., `5000`) |
| `assignedTo` | string | No | User ID to assign the opportunity to |
| `source` | string | No | Lead source (e.g., `"website form"`, `"referral"`) |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/opportunities/' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "pipelineId": "bCkKGpDsyPP4peuKowkG",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Website Redesign Project",
    "pipelineStageId": "stage_abc123",
    "status": "open",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "monetaryValue": 7500,
    "assignedTo": "uKxMbLQ9f3cR7oPdWlNe",
    "source": "website form"
  }'
```

## Response Example

```json
{
  "opportunity": {
    "id": "opp_new456",
    "name": "Website Redesign Project",
    "monetaryValue": 7500,
    "pipelineId": "bCkKGpDsyPP4peuKowkG",
    "pipelineStageId": "stage_abc123",
    "assignedTo": "uKxMbLQ9f3cR7oPdWlNe",
    "status": "open",
    "source": "website form",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "createdAt": "2024-03-01T12:00:00.000Z",
    "updatedAt": "2024-03-01T12:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing required fields or invalid field format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — pipelineId, pipelineStageId, or contactId does not exist |
| 422 | Unprocessable Entity — invalid status value or contactId not in the location |

## Common Use Cases
Create a new deal when a lead converts from a form submission, calendar booking, or manual entry. Typically used when a contact is qualified and enters the sales pipeline.

## Gotchas
- All six required fields must be present or you get a 400. Unlike contacts, there's no "optional everything" flexibility here.
- `status` must be one of the four enum values exactly. Passing `"closed"` or `"active"` will fail.
- `monetaryValue` must be a number, not a string. Passing `"7500"` instead of `7500` may cause silent issues.
- If the contact already has an opportunity in the same pipeline, this creates a second one. Use `upsert` to avoid duplicates.
- `pipelineStageId` must belong to the specified `pipelineId`. A valid stage ID from a different pipeline will return 404.
