# Delete User

- **Method:** DELETE
- **Path:** `/users/{userId}`
- **Scopes:** `users.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `userId` | string | Yes | The user ID to delete |

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/users/usr_xyz789ghi012' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "succeded": true
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — user ID does not exist |
| 422 | Unprocessable Entity — cannot delete the last admin |

## Common Use Cases
Remove a team member who has left the organization. Clean up test users.

## Gotchas
Note the typo in HL's response: `succeded` (not `succeeded`) — this is from the API itself. Deleting a user does NOT reassign their contacts, opportunities, or calendar events. Reassign those first or they become unassigned.
