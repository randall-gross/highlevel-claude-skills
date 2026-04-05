# Update Opportunity Status

- **Method:** PUT
- **Path:** `/opportunities/{id}/status`
- **Scopes:** `opportunities.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `id` | string | Yes | The ID of the opportunity |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `status` | string | Yes | One of: `"open"`, `"won"`, `"lost"`, `"abandoned"` |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/opportunities/opp_xyz789/status' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "status": "won"
  }'
```

## Response Example

```json
{
  "opportunity": {
    "id": "opp_xyz789",
    "name": "Website Redesign Project",
    "monetaryValue": 7500,
    "pipelineId": "bCkKGpDsyPP4peuKowkG",
    "pipelineStageId": "stage_def456",
    "assignedTo": "uKxMbLQ9f3cR7oPdWlNe",
    "status": "won",
    "source": "website form",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "lastStatusChangeAt": "2024-03-10T16:00:00.000Z",
    "createdAt": "2024-01-10T08:00:00.000Z",
    "updatedAt": "2024-03-10T16:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing status field or invalid status value |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — opportunity does not exist |
| 422 | Unprocessable Entity — invalid status enum value |

## Common Use Cases
Mark a deal as won after closing, or mark as lost/abandoned without changing any other opportunity fields. This is the preferred endpoint for status changes because it properly triggers status-related workflows.

## Gotchas
- **Use this instead of the general update endpoint for status changes.** This endpoint triggers HL workflow events specific to status changes (e.g., "Opportunity Status Changed" triggers). The general update endpoint may not fire those same workflow triggers.
- `lastStatusChangeAt` is automatically updated by the API. Do not try to set it manually.
- Changing from `"won"` back to `"open"` is allowed — there is no irreversible state.
- The response returns the full opportunity object, not just the status.
