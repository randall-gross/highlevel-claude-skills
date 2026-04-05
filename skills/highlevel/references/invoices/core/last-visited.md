# Update Last Visited

- **Method:** PATCH
- **Path:** `/invoices/stats/last-visited-at`
- **Scopes:** `invoices.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

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
  "success": true
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId or altType |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Track when a user last visited the invoices section, used for analytics and "new since last visit" indicators.

## Gotchas
- This is a UI tracking endpoint, not required for invoice operations.
- Updates the timestamp for the authenticated user in the given location.
