# Phone System API

Query phone number pools and location phone numbers within the HighLevel phone system.

## Required Scopes
- `phonenumbers.read`
- `numberpools.read`

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| [list-number-pools.md](core/list-number-pools.md) | GET | `/phone-system/number-pools` | List number pools |
| [list-numbers.md](core/list-numbers.md) | GET | `/phone-system/numbers/location/{locationId}` | List numbers for a location |

> This domain has placeholder endpoint files. Full documentation with request/response examples is planned for a future update.
