# Calendars — Blocked Slots

Manage blocked time slots on calendars to prevent bookings during specific periods.

## Endpoint Index

| File | Method | Path | Description |
|------|--------|------|-------------|
| [list.md](list.md) | GET | `/calendars/blocked-slots` | List blocked slots |
| [create.md](create.md) | POST | `/calendars/events/block-slots` | Create block slot |
| [update.md](update.md) | PUT | `/calendars/events/block-slots/{eventId}` | Update block slot |

Note: To delete a block slot, use `DELETE /calendars/events/{eventId}` (see [appointments/delete.md](../appointments/delete.md)).
