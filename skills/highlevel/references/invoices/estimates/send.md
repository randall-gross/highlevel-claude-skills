# Send Estimate

- **Method:** POST
- **Path:** `/invoices/estimate/{estimateId}/send`
- **Scopes:** `invoices/estimate.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| estimateId | string | Yes | Estimate ID |

### Body Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location"
}
```

## Response Example
```json
{
  "estimate": {
    "_id": "est_abc123",
    "status": "sent",
    "sentAt": "2026-04-04T12:00:00.000Z",
    "sentTo": {
      "email": "client@example.com"
    }
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId/altType or estimate not in sendable state |
| 401 | Unauthorized — invalid or expired token |
| 404 | Estimate not found |
| 422 | Contact has no email address |

## Common Use Cases
Send a draft estimate to the client for review and acceptance.

## Gotchas
- Estimate must be in `draft` status.
- Contact must have an email on file.
- Triggers HighLevel workflows for estimate-sent events.
