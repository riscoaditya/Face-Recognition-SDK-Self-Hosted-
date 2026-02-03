[![Telegram](https://img.shields.io/badge/Telegram-Chat-2CA5E0?logo=telegram&logoColor=white)](https://t.me/riscoaditya)
[![WhatsApp](https://img.shields.io/badge/WhatsApp-Chat-25D366?logo=whatsapp&logoColor=white)](https://wa.me/6282140000211)

# Face Recognition SDK (Self-Hosted) - Install Guide
Face Recognition SDK (Self-Hosted) is an enterprise-grade facial recognition solution designed for organizations that require full control, privacy, and on-premise deployment.

This solution is ideal for companies that want to integrate face recognition into their own systems while keeping all data inside their own infrastructure.

## Requirements
- Docker + Docker Compose
- Linux / Windows / macOS server

## Step 1 — Prepare Host ID (for stable licensing)
### macOS/Linux
Run:
./scripts/init_host_id.sh

### Windows (PowerShell)
Run:
.\scripts\init_host_id.ps1

This creates `host_id.txt`. Do NOT delete it.

## Step 2 — Configure Environment
Copy example env:
cp .env.example .env

Edit `.env`:
- API_KEY (required)
- ADMIN_KEY (required)
- LICENSE_KEY (paste from vendor)

> Need a license?
> - Purchase here: https://www.paypal.com/ncp/payment/WDZQYJBE72CEU
> - Your LICENSE_KEY will be sent to your payment email within 24 hours after payment.
> - Lifetime license

## Step 3 — Start
docker compose up -d

## Step 4 — Get Fingerprint (Activation)
If you don't have a license yet, start the service and request fingerprint:

curl -H "X-Admin-Key: <ADMIN_KEY>" http://localhost:8080/v1/admin/fingerprint

Send the fingerprint to the vendor to receive LICENSE_KEY.

## Step 5 — Test Health
curl -H "X-API-Key: <API_KEY>" http://localhost:8080/v1/health

## API Endpoints
- POST /v1/enroll?user_id=...
- POST /v1/verify?user_id=...
- POST /v1/identify
Headers:
- X-API-Key: <API_KEY>

## Troubleshooting
- If models not found: check ./models filenames and permissions
- If license invalid: enroll/verify will return 403 until activated

## 🆘 Support & Contact
Need help, integration support, or license inquiry?
- 💬 Telegram: https://t.me/riscoaditya  
- 📱 WhatsApp: https://wa.me/6282140000211