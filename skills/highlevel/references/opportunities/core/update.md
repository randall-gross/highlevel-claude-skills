# Update Opportunity

- **Method:** PUT
- **Path:** `/opportunities/{id}`
- **Scopes:** `opportunities.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `id` | string | Yes | The ID of the opportunity to update |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `pipelineId` | string | No | Move to a different pipeline |
| `name` | string | No | Update the opportunity name |
| `pipelineStageId` | string | No | Move to a different stage |
| `status` | string | No | One of: `"open"`, `"won"`, `"lost"`, `"abandoned"` |
| `monetaryValue` | number | No | Update deal value |
| `assignedTo` | string | No | Reassign to a different user |
| `source` | string | No | Update lead source |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/opportunities/opp_xyz789' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "pipelineStageId": "stage_def456",
    "monetaryValue": 12000
  }'
```

## Response Example

```json
{
  "opportunity": {
    "id": "opp_xyz789",
    "name": "Website Redesign Project",
    "monetaryValue": 12000,
    "pipelineId": "bCkKGpDsyPP4peuKowkG",
    "pipelineStageId": "stage_def456",
    "assignedTo": "uKxMbLQ9f3cR7oPdWlNe",
    "status": "open",
    "source": "website form",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "createdAt": "2024-01-10T08:00:00.000Z",
    "updatedAt": "2024-03-05T14:30:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid field format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — opportunity, pipelineId, or pipelineStageId does not exist |
| 422 | Unprocessable Entity — invalid status value |

## Common Use Cases
Move a deal to a new pipeline stage (e.g., from "Proposal Sent" to "Negotiation"), update the deal value after a revised quote, or reassign the deal to a different team member.

## Gotchas
- You cannot change the `contactId` on an existing opportunity. To move a deal to a different contact, delete and recreate.
- Changing `pipelineStageId` without changing `pipelineId` assumes the stage belongs to the current pipeline. If it doesn't, you get a 404.
- When changing `pipelineId`, you must also provide a valid `pipelineStageId` for the new pipeline.
- Updating `status` via this endpoint works, but the dedicated `update-status` endpoint is preferred for status-only changes as it triggers proper workflow events.
