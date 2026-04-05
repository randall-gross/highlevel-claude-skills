# Upsert Opportunity

- **Method:** POST
- **Path:** `/opportunities/upsert`
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
| `pipelineId` | string | Yes | The pipeline for the opportunity |
| `locationId` | string | Yes | The sub-account ID |
| `name` | string | Yes | Name/title of the opportunity |
| `pipelineStageId` | string | Yes | The stage within the pipeline |
| `status` | string | Yes | One of: `"open"`, `"won"`, `"lost"`, `"abandoned"` |
| `contactId` | string | Yes | The contact linked to this opportunity |
| `monetaryValue` | number | No | Deal value in dollars |
| `assignedTo` | string | No | User ID to assign the opportunity to |
| `source` | string | No | Lead source |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/opportunities/upsert' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "pipelineId": "bCkKGpDsyPP4peuKowkG",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "SEO Retainer",
    "pipelineStageId": "stage_abc123",
    "status": "open",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "monetaryValue": 2500,
    "source": "referral"
  }'
```

## Response Example

```json
{
  "opportunity": {
    "id": "opp_upserted001",
    "name": "SEO Retainer",
    "monetaryValue": 2500,
    "pipelineId": "bCkKGpDsyPP4peuKowkG",
    "pipelineStageId": "stage_abc123",
    "status": "open",
    "source": "referral",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "createdAt": "2024-03-01T12:00:00.000Z",
    "updatedAt": "2024-03-01T12:00:00.000Z"
  },
  "new": true
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — pipelineId, pipelineStageId, or contactId does not exist |
| 422 | Unprocessable Entity — invalid status or field values |

## Common Use Cases
Preferred endpoint for automated integrations (form submissions, webhook handlers) where the same contact may trigger multiple times. Prevents duplicate deals in the same pipeline.

## Gotchas
- **Match key is locationId + contactId + pipelineId.** If an opportunity already exists for that contact in that pipeline, it updates the existing one instead of creating a new one.
- The `new` field in the response tells you whether a new opportunity was created (`true`) or an existing one was updated (`false`).
- If a contact has multiple opportunities in the same pipeline (created via `create`), upsert updates the most recently created one.
- Unlike contact upsert which matches on email/phone, opportunity upsert matches on the contactId + pipelineId combination.
