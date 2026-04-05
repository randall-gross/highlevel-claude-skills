# Remove Contact from Workflow

- **Method:** DELETE
- **Path:** `/contacts/{contactId}/workflow/{workflowId}`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `contactId` | string | Yes | The ID of the contact |
| `workflowId` | string | Yes | The ID of the workflow to remove the contact from |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/workflow/wf_3aBcDeFgHiJk' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "succeeded": true
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid contactId or workflowId |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — contact or workflow does not exist |

## Common Use Cases
Remove a contact from an active workflow when they should no longer receive automated actions, such as after a manual conversion or opt-out request.

## Gotchas
- Removing a contact from a workflow stops all pending actions but does not undo actions already completed (emails sent, tags added, etc.).
- If the contact is not currently in the workflow, this may return a 404 or succeed silently.
- Note the path uses `workflow` (singular), not `workflows`.
- There is no "remove from all workflows" endpoint. You must remove from each workflow individually.
