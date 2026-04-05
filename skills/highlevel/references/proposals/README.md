# Proposals API

Manage document proposals and contract templates, including listing and sending documents and templates.

## Required Scopes
- `documents_contracts/list.readonly`
- `documents_contracts/sendLink.write`
- `documents_contracts_template/list.readonly`
- `documents_contracts_template/sendLink.write`

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| [list-documents.md](core/list-documents.md) | GET | `/proposals/document` | List documents |
| [send-document.md](core/send-document.md) | POST | `/proposals/document/send` | Send a document |
| [list-templates.md](core/list-templates.md) | GET | `/proposals/templates` | List templates |
| [send-template.md](core/send-template.md) | POST | `/proposals/templates/send` | Send a template |

> This domain has placeholder endpoint files. Full documentation with request/response examples is planned for a future update.
