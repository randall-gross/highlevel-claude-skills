# Snapshots API

List snapshots, generate share links, and check push status for HighLevel account snapshots.

## Required Scopes
- `snapshots.readonly`
- `snapshots.write`

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| `core/list.md` | GET | `/snapshots/` | List snapshots |
| `core/share-link.md` | POST | `/snapshots/share/link` | Create a snapshot share link |
| `core/push-status.md` | GET | `/snapshots/snapshot-status/{snapshotId}` | Get snapshot push status |
| `core/push-status-location.md` | GET | `/snapshots/snapshot-status/{snapshotId}/location/{locationId}` | Get push status for a location |

> This domain has placeholder endpoint files. Full documentation with request/response examples is planned for a future update.
