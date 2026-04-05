# Custom Fields V2 API

Cross-object custom field management. Unlike the contacts-specific custom fields endpoints, this V2 API manages custom fields and folders for ANY object type (contacts, opportunities, custom objects, etc.) using the `objectKey` parameter.

## Required Scopes

- Same scopes as the object you're managing fields for (e.g., `contacts.readonly` for contact fields)

## Common Patterns

- **objectKey identifies the target object type:** `contacts`, `opportunities`, `custom_objects.project`, etc.
- **dataType options:** `TEXT`, `LARGE_TEXT`, `NUMERICAL`, `PHONE`, `EMAIL`, `MONETORY` (sic), `CHECKBOX`, `SINGLE_OPTIONS`, `MULTIPLE_OPTIONS`, `DATE`, `FILE_UPLOAD`, `SIGNATURE`
- **Folders** organize fields visually in the HL UI — they don't affect API access.
- **Field IDs** are used when setting custom field values on records.

## Subdomain Routing

| Subdomain | Description |
|-----------|-------------|
| `core/` | CRUD operations on custom fields |
| `folders/` | Create, update, delete field folders |

## Related Domains

- **Contacts** — contact custom field values set via the contacts API
- **Custom Objects** — custom object fields managed here
- **Opportunities** — opportunity custom fields managed here
