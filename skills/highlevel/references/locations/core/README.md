# Locations — Core

CRUD operations for sub-accounts (locations), plus search and timezone lookup.

## Endpoints

| Method | Path | File | Description |
|--------|------|------|-------------|
| GET | `/locations/{locationId}` | [get.md](get.md) | Get sub-account details |
| POST | `/locations/` | [create.md](create.md) | Create sub-account (agency-level) |
| PUT | `/locations/{locationId}` | [update.md](update.md) | Update sub-account |
| DELETE | `/locations/{locationId}` | [delete.md](delete.md) | Delete sub-account |
| GET | `/locations/search` | [search.md](search.md) | Search locations |
| GET | `/locations/{locationId}/timezones` | [timezones.md](timezones.md) | Fetch available timezones |
