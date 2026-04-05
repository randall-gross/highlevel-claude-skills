# Webhook Event Types Reference

> **This is a reference guide, not an API endpoint.**

Complete list of webhook event types fired by HighLevel, organized by category. Use these type strings when building your webhook handler's switch/case logic.

## Contact Events

| Event Type | Description |
|------------|-------------|
| `ContactCreate` | A new contact was created |
| `ContactUpdate` | A contact's fields were updated |
| `ContactDelete` | A contact was deleted |
| `ContactDndUpdate` | A contact's Do Not Disturb settings changed |
| `ContactTagUpdate` | Tags were added to or removed from a contact |

**Payload includes:** `contactId`, `locationId`, `firstName`, `lastName`, `email`, `phone`, `tags`, `customFields`, and the changed fields.

## Conversation Events

| Event Type | Description |
|------------|-------------|
| `ConversationUnreadWebhook` | A conversation has unread messages |
| `ConversationProviderInboundMessage` | An inbound message was received (SMS, email, etc.) |

**Payload includes:** `conversationId`, `contactId`, `locationId`, `message`, `type` (SMS, Email, etc.), `direction`.

## Appointment Events

| Event Type | Description |
|------------|-------------|
| `AppointmentCreate` | A new appointment was booked |
| `AppointmentUpdate` | An appointment was modified (rescheduled, notes updated) |
| `AppointmentDelete` | An appointment was cancelled or deleted |

**Payload includes:** `appointmentId`, `calendarId`, `contactId`, `locationId`, `startTime`, `endTime`, `status`, `assignedUserId`.

## Opportunity Events

| Event Type | Description |
|------------|-------------|
| `OpportunityCreate` | A new opportunity was created |
| `OpportunityUpdate` | An opportunity was updated |
| `OpportunityDelete` | An opportunity was deleted |
| `OpportunityStatusUpdate` | An opportunity's status changed (open, won, lost, abandoned) |
| `OpportunityAssignedToUpdate` | An opportunity was reassigned to a different user |
| `OpportunityMonetaryValueUpdate` | An opportunity's monetary value changed |
| `OpportunityStageUpdate` | An opportunity moved to a different pipeline stage |

**Payload includes:** `opportunityId`, `pipelineId`, `pipelineStageId`, `contactId`, `locationId`, `status`, `monetaryValue`, `assignedTo`.

## Payment Events

| Event Type | Description |
|------------|-------------|
| `PaymentReceived` | A payment was successfully processed |

**Payload includes:** `paymentId`, `contactId`, `locationId`, `amount`, `currency`, `status`.

## Invoice Events

| Event Type | Description |
|------------|-------------|
| `InvoiceCreate` | A new invoice was created |
| `InvoiceUpdate` | An invoice was updated |
| `InvoiceDelete` | An invoice was deleted |
| `InvoiceSent` | An invoice was sent to the contact |
| `InvoicePartiallyPaid` | A partial payment was received on an invoice |
| `InvoicePaid` | An invoice was fully paid |
| `InvoiceVoid` | An invoice was voided |

**Payload includes:** `invoiceId`, `contactId`, `locationId`, `amount`, `status`, `dueDate`.

## Form Events

| Event Type | Description |
|------------|-------------|
| `FormSubmitted` | A form was submitted |

**Payload includes:** `formId`, `contactId`, `locationId`, `formName`, `submissions` (key-value pairs of field names to values).

## Note Events

| Event Type | Description |
|------------|-------------|
| `NoteCreate` | A note was added to a contact |
| `NoteUpdate` | A note was updated |
| `NoteDelete` | A note was deleted |

**Payload includes:** `noteId`, `contactId`, `locationId`, `body`.

## Task Events

| Event Type | Description |
|------------|-------------|
| `TaskCreate` | A task was created |
| `TaskUpdate` | A task was updated |
| `TaskDelete` | A task was deleted |
| `TaskComplete` | A task was marked as completed |

**Payload includes:** `taskId`, `contactId`, `locationId`, `title`, `dueDate`, `assignedTo`, `status`.

## Product Events

| Event Type | Description |
|------------|-------------|
| `ProductCreate` | A product was created |
| `ProductUpdate` | A product was updated |
| `ProductDelete` | A product was deleted |

**Payload includes:** `productId`, `locationId`, `name`, `price`, `currency`.

## Price Events

| Event Type | Description |
|------------|-------------|
| `PriceCreate` | A price was created for a product |
| `PriceUpdate` | A price was updated |
| `PriceDelete` | A price was deleted |

**Payload includes:** `priceId`, `productId`, `locationId`, `amount`, `currency`, `recurring`.

## User Events

| Event Type | Description |
|------------|-------------|
| `UserCreate` | A new user (team member) was created |

**Payload includes:** `userId`, `locationId`, `email`, `firstName`, `lastName`, `role`.

## Custom Object Events

| Event Type | Description |
|------------|-------------|
| `CustomObjectRecordCreate` | A custom object record was created |
| `CustomObjectRecordUpdate` | A custom object record was updated |
| `CustomObjectRecordDelete` | A custom object record was deleted |

**Payload includes:** `recordId`, `objectKey`, `locationId`, `fields` (key-value pairs).

## Association Events

| Event Type | Description |
|------------|-------------|
| `AssociationCreate` | An association definition was created |
| `RelationCreate` | A relation between records was created |
| `RelationDelete` | A relation between records was deleted |

**Payload includes:** `associationId`, `locationId`, `firstRecordId`, `secondRecordId`.

## Webhook Payload Structure

All webhook payloads follow this general structure:

```json
{
  "type": "ContactCreate",
  "locationId": "ve9EPM428h8vShlRW1KT",
  "id": "nmFmQEsNgz6AVpgLVUJ0",
  "timestamp": "2024-06-15T14:30:00.000Z",
  // ... event-specific fields
}
```

## Handler Pattern

```typescript
export async function POST(request: NextRequest) {
  // After signature verification...
  const payload = JSON.parse(rawBody);

  switch (payload.type) {
    // Contact events
    case 'ContactCreate':
    case 'ContactUpdate':
      await syncContact(payload);
      break;

    // Appointment events
    case 'AppointmentCreate':
    case 'AppointmentUpdate':
      await syncAppointment(payload);
      break;

    // Opportunity events
    case 'OpportunityStageUpdate':
      await handleStageChange(payload);
      break;
    case 'OpportunityStatusUpdate':
      await handleStatusChange(payload);
      break;

    // Form events
    case 'FormSubmitted':
      await processFormSubmission(payload);
      break;

    default:
      console.log(`Unhandled webhook event: ${payload.type}`);
  }

  return NextResponse.json({ received: true });
}
```

## Related

- `../verification/signature-validation.md` — How to verify webhook signatures
- `../README.md` — Webhook system overview
