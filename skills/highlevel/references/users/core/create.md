# Create User

- **Method:** POST
- **Path:** `/users/`
- **Scopes:** `users.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `firstName` | string | Yes | User's first name |
| `lastName` | string | Yes | User's last name |
| `email` | string | Yes | User's email address (must be unique) |
| `phone` | string | No | Phone number in E.164 format |
| `type` | string | Yes | `account` (agency-level) or `location` (sub-account-level) |
| `role` | string | Yes | Role: `admin`, `user`, or custom role ID |
| `locationIds` | string[] | Yes | Array of location IDs the user can access |
| `permissions` | object | No | Granular permissions object |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/users/' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "firstName": "Eric",
    "lastName": "Partner",
    "email": "eric@rocketdigitalmarketing.io",
    "phone": "+14155559999",
    "type": "account",
    "role": "admin",
    "locationIds": ["ve9EPM428h8vShlRW1KT"],
    "permissions": {
      "contactsEnabled": true,
      "opportunitiesEnabled": true,
      "dashboardStatsEnabled": true
    }
  }'
```

## Response Example

```json
{
  "id": "usr_xyz789ghi012",
  "firstName": "Eric",
  "lastName": "Partner",
  "email": "eric@rocketdigitalmarketing.io",
  "phone": "+14155559999",
  "type": "account",
  "role": "admin",
  "locationIds": ["ve9EPM428h8vShlRW1KT"]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing required fields or invalid data |
| 401 | Unauthorized — invalid or expired token |
| 409 | Conflict — email already exists in the system |
| 422 | Unprocessable Entity — invalid role or locationId |

## Common Use Cases
Programmatically onboard new team members when a client signs up. Automate user provisioning as part of a SaaS onboarding flow.

## Gotchas
Email must be globally unique across the entire HL platform, not just your agency. If a user already exists with that email in another agency, you'll get a 409. The `permissions` object is complex — omit it to get sensible defaults for the given role.
