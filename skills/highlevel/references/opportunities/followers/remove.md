# Remove Followers from Opportunity

- **Method:** DELETE
- **Path:** `/opportunities/{id}/followers`
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
| `followers` | string[] | Yes | Array of user IDs to remove as followers |

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/opportunities/opp_xyz789/followers' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "followers": ["vL2mNpQ3rS5uWxYzA1bC"]
  }'
```

## Response Example

```json
{
  "followers": ["uKxMbLQ9f3cR7oPdWlNe"],
  "followersRemoved": ["vL2mNpQ3rS5uWxYzA1bC"]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing followers array or empty array |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — opportunity does not exist |
| 422 | Unprocessable Entity — one or more user IDs are invalid |

## Common Use Cases
Unsubscribe team members from deal notifications when they are no longer involved in the opportunity, or when reassigning a deal to a different team.

## Gotchas
- This is a DELETE request with a request body. Some HTTP clients (like older versions of Axios) do not support bodies on DELETE requests — you may need to pass the body via the `data` config option.
- If a user ID is not currently a follower, it is silently ignored (no error).
- `followers` in the response shows the remaining followers after removal, not the original list.
- `followersRemoved` shows only the users that were actually removed, excluding any IDs that weren't followers to begin with.
