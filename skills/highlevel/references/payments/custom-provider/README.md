# Custom Provider Subdomain

Configure and manage custom payment providers.

## Scopes

- `payments/custom-provider.readonly` — Read provider config
- `payments/custom-provider.write` — Create, update, disconnect providers

## Endpoints

| Method | Path | File | Description |
|--------|------|------|-------------|
| GET | `/payments/custom-provider/connect` | [connect-get.md](connect-get.md) | Fetch provider config |
| POST | `/payments/custom-provider/connect` | [connect-create.md](connect-create.md) | Create provider config |
| POST | `/payments/custom-provider/disconnect` | [disconnect.md](disconnect.md) | Disconnect provider |
| PUT | `/payments/custom-provider/capabilities` | [capabilities.md](capabilities.md) | Update provider capabilities |
| POST | `/payments/custom-provider/provider` | [provider-create.md](provider-create.md) | Create new integration |
| DELETE | `/payments/custom-provider/provider` | [provider-delete.md](provider-delete.md) | Delete integration |
