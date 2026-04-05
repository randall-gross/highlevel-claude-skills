# Calendars Domain

Calendar management for appointment scheduling, resource booking, and event coordination.

## Required Scopes

| Scope | Access |
|-------|--------|
| `calendars.readonly` | Read calendars |
| `calendars.write` | Create/update/delete calendars |
| `calendars/events.readonly` | Read events and appointments |
| `calendars/events.write` | Create/update/delete events and appointments |
| `calendars/groups.readonly` | Read calendar groups |
| `calendars/groups.write` | Create/update/delete calendar groups |
| `calendars/resources.readonly` | Read calendar resources |
| `calendars/resources.write` | Create/update/delete calendar resources |

## Subdomain Routing

| Subdomain | Path Prefix | Endpoints | Description |
|-----------|-------------|-----------|-------------|
| [core/](core/) | `/calendars/` | 6 | Calendar CRUD + free slots |
| [appointments/](appointments/) | `/calendars/events/appointments` | 4 | Appointment booking and management |
| [notes/](notes/) | `/calendars/appointments/{appointmentId}/notes` | 4 | Notes on appointments |
| [groups/](groups/) | `/calendars/groups` | 6 | Calendar group management |
| [resources/](resources/) | `/calendars/resources/{resourceType}` | 5 | Equipment and room resources |
| [notifications/](notifications/) | `/calendars/{calendarId}/notifications` | 5 | Calendar notification rules |
| [blocked-slots/](blocked-slots/) | `/calendars/events/block-slots` | 3 | Block time slots |
| [events/](events/) | `/calendars/events` | 1 | List all calendar events |

**Total: 34 endpoints**

## Related Domains

- **Contacts** — Appointments reference `contactId` to link bookings to contacts
- **Users** — Calendars are assigned to team members via `userId`
- **Locations** — All calendars belong to a `locationId`

## Common Headers

```
Authorization: Bearer {token}
Content-Type: application/json
Version: 2021-07-28
```

## Base URL

```
https://services.leadconnectorhq.com
```
