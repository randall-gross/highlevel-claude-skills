# List Workflows

- **Method:** GET
- **Path:** `/workflows/`
- **Scopes:** `workflows.readonly`
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
  'https://services.leadconnectorhq.com/workflows/?locationId=ve9EPM428h8vShlRW1KT' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "workflows": [
    {
      "id": "wf_abc123def456",
      "name": "New Lead Follow-Up",
      "status": "active",
      "version": 2
    },
    {
      "id": "wf_ghi789jkl012",
      "name": "Appointment Reminder",
      "status": "draft",
      "version": 1
    }
  ]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId parameter |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Retrieve all workflows for a location to display in a dashboard, or look up a workflow ID before adding a contact to it via the Contacts API.

## Gotchas
- This endpoint is read-only. You cannot create, update, or delete workflows via the API — workflow management is done in the HL UI.
- To add/remove contacts from a workflow, use `POST /contacts/{contactId}/workflow/{workflowId}` and `DELETE /contacts/{contactId}/workflow/{workflowId}` (in the Contacts domain).
- The `status` field can be `active` or `draft`. Only active workflows will execute when contacts are added.
