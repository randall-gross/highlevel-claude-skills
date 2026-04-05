# List Pipelines

- **Method:** GET
- **Path:** `/opportunities/pipelines`
- **Scopes:** `opportunities.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/opportunities/pipelines?locationId=ve9EPM428h8vShlRW1KT' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "pipelines": [
    {
      "id": "bCkKGpDsyPP4peuKowkG",
      "name": "Sales Pipeline",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "stages": [
        {
          "id": "stage_abc123",
          "name": "New Lead",
          "position": 0
        },
        {
          "id": "stage_def456",
          "name": "Proposal Sent",
          "position": 1
        },
        {
          "id": "stage_ghi789",
          "name": "Negotiation",
          "position": 2
        },
        {
          "id": "stage_jkl012",
          "name": "Closed Won",
          "position": 3
        }
      ],
      "showInFunnel": true,
      "showInPieChart": true
    },
    {
      "id": "pipe_onboard001",
      "name": "Onboarding Pipeline",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "stages": [
        {
          "id": "stage_onb001",
          "name": "Kickoff",
          "position": 0
        },
        {
          "id": "stage_onb002",
          "name": "Setup",
          "position": 1
        },
        {
          "id": "stage_onb003",
          "name": "Go Live",
          "position": 2
        }
      ],
      "showInFunnel": false,
      "showInPieChart": false
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
Fetch all pipelines and their stages to populate a pipeline selector dropdown, build a Kanban board, or look up valid `pipelineId` and `pipelineStageId` values before creating/updating opportunities.

## Gotchas
- **This is the only way to get stage IDs.** There is no separate "list stages" endpoint. Stages are nested inside the pipeline response.
- Stages are ordered by `position` (0-indexed). The UI displays them left-to-right in this order.
- A location can have multiple pipelines. Each pipeline has its own independent set of stages.
- `showInFunnel` and `showInPieChart` control dashboard visibility in the HL UI — they don't affect API behavior.
- Pipeline and stage IDs are stable. They don't change when you rename a pipeline or stage in the UI.
