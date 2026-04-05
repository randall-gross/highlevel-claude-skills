# Invoices — Schedules

Recurring invoice schedule management including activation, cancellation, and auto-payment.

## Endpoints

| Method | Path | File | Description |
|--------|------|------|-------------|
| GET | `/invoices/schedule` | [list.md](list.md) | List schedules |
| GET | `/invoices/schedule/{scheduleId}` | [get.md](get.md) | Get schedule |
| POST | `/invoices/schedule` | [create.md](create.md) | Create recurring schedule |
| PUT | `/invoices/schedule/{scheduleId}` | [update.md](update.md) | Update schedule |
| DELETE | `/invoices/schedule/{scheduleId}` | [delete.md](delete.md) | Delete schedule |
| POST | `/invoices/schedule/{scheduleId}/schedule` | [schedule.md](schedule.md) | Activate/schedule recurring invoice |
| POST | `/invoices/schedule/{scheduleId}/cancel` | [cancel.md](cancel.md) | Cancel scheduled invoice |
| POST | `/invoices/schedule/{scheduleId}/auto-payment` | [auto-payment.md](auto-payment.md) | Manage auto-payment settings |
| POST | `/invoices/schedule/{scheduleId}/updateAndSchedule` | [update-and-schedule.md](update-and-schedule.md) | Update and re-schedule |

## Required Scopes
- `invoices/schedule.readonly` — GET endpoints
- `invoices/schedule.write` — POST/PUT/DELETE endpoints
