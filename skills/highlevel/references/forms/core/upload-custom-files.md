# Upload Custom Files

- **Method:** POST
- **Path:** `/forms/upload-custom-files`
- **Scopes:** `forms.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Request Body (multipart/form-data)
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `contactId` | string | Yes | The contact ID to attach files to |
| `files` | File | Yes | One or more files to upload |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/forms/upload-custom-files' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28' \
  -F 'locationId=ve9EPM428h8vShlRW1KT' \
  -F 'contactId=nmFmQEsNgz6AVpgLVUJ0' \
  -F 'files=@/path/to/document.pdf'
```

## Response Example

```json
{
  "uploadedFiles": [
    {
      "url": "https://storage.leadconnectorhq.com/files/ve9EPM428h8vShlRW1KT/document.pdf",
      "name": "document.pdf",
      "size": 245678
    }
  ]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId, contactId, or files |
| 401 | Unauthorized — invalid or expired token |
| 413 | Payload Too Large — file exceeds size limit |
| 422 | Unprocessable Entity — unsupported file type |

## Common Use Cases
Upload documents to a contact's custom file upload field. Attach proposal PDFs or contracts to contact records programmatically.

## Gotchas
This endpoint uses `multipart/form-data`, NOT JSON. The Content-Type header should be omitted (curl sets it automatically with the boundary). File size limits apply (typically 10MB per file). The returned URL is the permanent storage URL that can be set as the value of a `FILE_UPLOAD` custom field on the contact.
