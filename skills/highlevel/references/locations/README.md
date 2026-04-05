# Locations Domain

Sub-account/location management. Locations represent individual business accounts within the agency. Each location has its own contacts, pipelines, workflows, and settings.

## Required Scopes

| Scope | Access |
|-------|--------|
| `locations.readonly` | Read location details |
| `locations.write` | Create/update/delete locations |
| `locations/customFields.readonly` | Read custom fields |
| `locations/customFields.write` | Create/update/delete custom fields |
| `locations/customValues.readonly` | Read custom values |
| `locations/customValues.write` | Create/update/delete custom values |
| `locations/tags.readonly` | Read tags |
| `locations/tags.write` | Create/update/delete tags |
| `locations/tasks.readonly` | Read tasks |
| `locations/tasks.write` | Create/update/delete tasks |
| `locations/templates.readonly` | Read templates |

## Subdomains

| Subdomain | Path | Endpoints | Description |
|-----------|------|-----------|-------------|
| [Core](core/) | `/locations` | 6 | Location CRUD, search, timezones |
| [Custom Fields](custom-fields/) | `/locations/{locationId}/customFields` | 6 | Field definitions for contacts/opportunities |
| [Custom Values](custom-values/) | `/locations/{locationId}/customValues` | 5 | Reusable value snippets (company name, address, etc.) |
| [Tags](tags/) | `/locations/{locationId}/tags` | 5 | Contact/opportunity tag management |
| [Recurring Tasks](recurring-tasks/) | `/locations/{locationId}/recurring-tasks` | 4 | Automated recurring task definitions |
| [Tasks](tasks/) | `/locations/{locationId}/tasks` | 1 | Task search/filter |
| [Templates](templates/) | `/locations/{locationId}/templates` | 2 | Email/SMS template management |

## Related

All domains use `locationId` as the primary scoping parameter. A valid location ID is required for nearly every API call across contacts, opportunities, calendars, conversations, workflows, etc.

## Base URL

```
https://services.leadconnectorhq.com
```

## Common Headers

```
Authorization: Bearer {token}
Content-Type: application/json
Version: 2021-07-28
```
