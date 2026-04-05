# Media API

Upload, organize, and manage media files and folders in the HighLevel media library.

## Required Scopes
- `medias.readonly`
- `medias.write`

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| `core/list.md` | GET | `/medias/files` | List media files |
| `core/upload.md` | POST | `/medias/upload-file` | Upload a file |
| `core/update.md` | POST | `/medias/{id}` | Update a file |
| `core/delete.md` | DELETE | `/medias/{id}` | Delete a file |
| `core/create-folder.md` | POST | `/medias/folder` | Create a folder |
| `core/bulk-delete.md` | PUT | `/medias/delete-files` | Bulk delete files |
| `core/bulk-update.md` | PUT | `/medias/update-files` | Bulk update files |

> This domain has placeholder endpoint files. Full documentation with request/response examples is planned for a future update.
