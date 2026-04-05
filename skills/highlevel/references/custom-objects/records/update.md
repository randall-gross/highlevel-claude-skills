# Update Custom Object Record

- **Method:** PUT
- **Path:** `/objects/{schemaKey}/records/{id}`
- **Scopes:** `objects/record.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `schemaKey` | string | Yes | The schema key (e.g., `custom_objects.task`) |
| `id` | string | Yes | The record ID |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `properties` | object | Yes | Key-value pairs for fields to update |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/objects/custom_objects.task/records/rec_abc123def456' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "properties": {
      "custom_objects.task.status": "Claimed"
    }
  }'
```

## Response Example

```json
{
  "id": "rec_abc123def456",
  "schemaKey": "custom_objects.task",
  "locationId": "ve9EPM428h8vShlRW1KT",
  "properties": {
    "custom_objects.task.title": "Build login page",
    "custom_objects.task.status": "Claimed",
    "custom_objects.task.assignee": "Claude-Frontend"
  },
  "createdAt": "2024-03-15T10:30:00.000Z",
  "updatedAt": "2024-03-17T11:00:00.000Z"
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid field values |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — record ID or schema key does not exist |

## Common Use Cases
Update a task's status (e.g., "Ready" to "Claimed" to "Done"), or change the assignee on a record.

## Gotchas
- Unlike schema updates, record updates are a **partial merge** — you only need to send the fields you want to change. Omitted fields retain their current values.
- Property keys must use full dot-notation (e.g., `custom_objects.task.status`).
- The `locationId` is NOT required in the body for updates — it is inferred from the existing record.
