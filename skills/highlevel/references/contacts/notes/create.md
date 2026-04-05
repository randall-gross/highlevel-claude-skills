# Create Contact Note

- **Method:** POST
- **Path:** `/contacts/{contactId}/notes`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `contactId` | string | Yes | The ID of the contact |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `body` | string | Yes | The note text content |
| `userId` | string | No | User ID of the note author (defaults to API user) |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/contacts/nmFmQEsNgz6AVpgLVUJ0/notes' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "body": "Spoke with John about the Q2 renewal. He wants to upgrade to the premium plan."
  }'
```

## Response Example

```json
{
  "note": {
    "id": "note_9xYzAbCdEfGh",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "body": "Spoke with John about the Q2 renewal. He wants to upgrade to the premium plan.",
    "userId": "uKxMbLQ9f3cR7oPdWlNe",
    "dateAdded": "2024-03-05T16:20:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing body field or empty string |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — contact does not exist |

## Common Use Cases
Log call summaries, meeting notes, or internal comments on a contact record from a custom CRM interface or automated workflow.

## Gotchas
- The `body` field is plain text. HTML is not rendered in the HL UI.
- Notes do not trigger workflows. If you need a workflow trigger, use a tag change instead.
- The `userId` defaults to the authenticated user. Pass a specific `userId` if you want the note attributed to a different team member.
