# Add Contact to Workflow

- **Method:** POST
- **Path:** `/contacts/{contactId}/workflow/{workflowId}`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `contactId` | string | Yes | The ID of the contact |
| `workflowId` | string | Yes | The ID of the workflow to enroll the contact in |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X POST \
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
| 422 | Unprocessable Entity — workflow is not published or contact is already enrolled |

## Common Use Cases
Manually enroll a contact in an automation workflow from a custom UI or external integration, such as triggering an onboarding sequence after a purchase.

## Gotchas
- The workflow must be **published** (active). Enrolling in a draft workflow returns a 422.
- Unlike campaigns, workflows are the modern HL automation system and support complex branching logic.
- If the workflow has a "contact enrolled" trigger, the contact enters at that trigger point. If it has a different trigger type (e.g., form submitted), enrolling via API may not work as expected.
- A contact can only be in a workflow once at a time. Attempting to add them again while active returns a 422.
- Note the path uses `workflow` (singular), not `workflows`.
