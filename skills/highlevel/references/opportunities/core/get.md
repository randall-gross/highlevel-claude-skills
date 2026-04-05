# Get Opportunity

- **Method:** GET
- **Path:** `/opportunities/{id}`
- **Scopes:** `opportunities.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `id` | string | Yes | The ID of the opportunity to retrieve |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/opportunities/opp_xyz789' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "opportunity": {
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
      "email": "john.doe@example.com",
      "phone": "+14155551234"
    },
    "lastStatusChangeAt": "2024-02-15T10:30:00.000Z",
    "createdAt": "2024-01-10T08:00:00.000Z",
    "updatedAt": "2024-02-15T10:30:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid opportunity ID format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — opportunity does not exist or belongs to a different location |

## Common Use Cases
Retrieve full opportunity details before displaying a deal card or before updating the opportunity's stage or monetary value.

## Gotchas
- The response includes an embedded `contact` object with basic info, so you don't need a separate contact fetch for display purposes.
- `monetaryValue` is returned as a number. Some older records may have `0` instead of `null` when no value was set.
