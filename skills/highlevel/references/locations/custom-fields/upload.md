# Upload File to Custom Field

- **Method:** POST
- **Path:** `/locations/{locationId}/customFields/upload`
- **Scopes:** `locations/customFields.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |

### Body Parameters (multipart/form-data)

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `file` | file | Yes | The file to upload |
| `id` | string | Yes | The custom field ID (must be FILE_UPLOAD type) |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/customFields/upload' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Version: 2021-07-28' \
  -F 'file=@/path/to/document.pdf' \
  -F 'id=cf_fileField123'
```

## Response Example

```json
{
  "uploadedFiles": {
    "cf_fileField123": {
      "url": "https://storage.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/customFields/cf_fileField123/document.pdf",
      "name": "document.pdf",
      "size": 102400,
      "type": "application/pdf"
    }
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing file or field ID |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — custom field does not exist |
| 413 | Payload Too Large — file exceeds size limit |
| 422 | Unprocessable Entity — field is not FILE_UPLOAD type |

## Common Use Cases

Upload files (documents, images) to a FILE_UPLOAD custom field. Used for attaching contracts, photos, or other documents to contact records.

## Gotchas

- Content-Type must be `multipart/form-data`, not `application/json`. Do **not** set the Content-Type header manually; let your HTTP client set it with the boundary.
- The target custom field must have `dataType: FILE_UPLOAD`. Uploading to other field types returns a 422.
- File size limits apply but are not documented. Test with your expected file sizes.
