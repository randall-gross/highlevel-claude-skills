# Webhook Signature Validation

> **This is a guide, not an API endpoint.**

Every webhook from HighLevel includes an `x-wh-signature` header containing an HMAC-SHA256 signature. Always validate this signature to ensure the webhook is genuinely from HL and hasn't been tampered with.

## How It Works

1. HL computes `HMAC-SHA256(webhook_secret, raw_request_body)` and sends it as the `x-wh-signature` header
2. Your server computes the same HMAC using your stored webhook secret
3. Compare the two values — if they match, the webhook is authentic

## Node.js Implementation

### Next.js App Router (Route Handler)

```typescript
// app/api/webhooks/ghl/route.ts
import { NextRequest, NextResponse } from 'next/server';
import crypto from 'crypto';

const WEBHOOK_SECRET = process.env.GHL_WEBHOOK_SECRET!;

function verifySignature(body: string, signature: string): boolean {
  const computed = crypto
    .createHmac('sha256', WEBHOOK_SECRET)
    .update(body)
    .digest('hex');

  // Use timingSafeEqual to prevent timing attacks
  try {
    return crypto.timingSafeEqual(
      Buffer.from(computed, 'hex'),
      Buffer.from(signature, 'hex')
    );
  } catch {
    return false;
  }
}

export async function POST(request: NextRequest) {
  const signature = request.headers.get('x-wh-signature');

  if (!signature) {
    return NextResponse.json(
      { error: 'Missing signature' },
      { status: 401 }
    );
  }

  // IMPORTANT: Read the raw body as text, not parsed JSON
  const rawBody = await request.text();

  if (!verifySignature(rawBody, signature)) {
    return NextResponse.json(
      { error: 'Invalid signature' },
      { status: 401 }
    );
  }

  // Signature verified — safe to parse and process
  const payload = JSON.parse(rawBody);

  console.log('Webhook event:', payload.type);
  console.log('Payload:', payload);

  // Process the webhook asynchronously if it takes time
  // (respond within 30 seconds or HL marks it as failed)

  switch (payload.type) {
    case 'ContactCreate':
      await handleContactCreate(payload);
      break;
    case 'AppointmentCreate':
      await handleAppointmentCreate(payload);
      break;
    case 'OpportunityStatusUpdate':
      await handleOpportunityStatusUpdate(payload);
      break;
    default:
      console.log('Unhandled event type:', payload.type);
  }

  // Always respond 200 quickly
  return NextResponse.json({ received: true });
}

async function handleContactCreate(payload: any) {
  // Your business logic here
}

async function handleAppointmentCreate(payload: any) {
  // Your business logic here
}

async function handleOpportunityStatusUpdate(payload: any) {
  // Your business logic here
}
```

### Express.js

```typescript
import express from 'express';
import crypto from 'crypto';

const app = express();

// IMPORTANT: Use raw body parser for webhook routes
app.post('/webhooks/ghl',
  express.raw({ type: 'application/json' }),
  (req, res) => {
    const signature = req.headers['x-wh-signature'] as string;
    const rawBody = req.body.toString('utf-8');

    const computed = crypto
      .createHmac('sha256', process.env.GHL_WEBHOOK_SECRET!)
      .update(rawBody)
      .digest('hex');

    const isValid = crypto.timingSafeEqual(
      Buffer.from(computed, 'hex'),
      Buffer.from(signature, 'hex')
    );

    if (!isValid) {
      return res.status(401).json({ error: 'Invalid signature' });
    }

    const payload = JSON.parse(rawBody);
    // Process payload...

    res.json({ received: true });
  }
);
```

## Environment Setup

```bash
# .env.local
GHL_WEBHOOK_SECRET=your_webhook_secret_from_hl_settings
```

## Key Gotchas

1. **Read the raw body, not parsed JSON.** If your framework auto-parses JSON before you compute the HMAC, the re-serialized body may differ from the original (whitespace, key order), causing signature mismatch.

2. **Use `timingSafeEqual`, not `===`.** String comparison with `===` leaks timing information that could allow an attacker to forge signatures byte by byte.

3. **Respond fast.** HL expects a response within 30 seconds. If your processing takes longer, enqueue the work and respond immediately.

4. **5xx errors are NOT retried.** Only 429 (rate limit) responses trigger retries. If your server returns 500, the webhook is lost. Build resilient error handling.

5. **429 retry schedule:** 6 attempts with exponential backoff over approximately 70 minutes.

## Related

- `../events/event-types-reference.md` — Complete list of webhook event types
- `../README.md` — Webhook system overview
