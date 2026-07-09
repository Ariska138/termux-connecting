# Architecture

## System Design

```
┌────────────────────────┐     SSH (port 8022)     ┌──────────────────────┐
│     Termux (HP)        │ ◄──────────────────────► │     PC/Mac           │
│                        │         WiFi/LAN         │                      │
│  termux-connecting     │                          │  termux-connect-pc   │
│  - update/upgrade      │                          │  - connection        │
│  - git/node install    │                          │  - check             │
│  - passwd setup        │                          │  - Telegram alert    │
│  - tampilkan IP        │                          │                      │
└────────────────────────┘                          └──────────────────────┘
```

## Flow Setup

### Termux Side (`termux-connecting`)

1. **Update system** — `pkg update && pkg upgrade` (timeout 300s, fallback ke `termux-change-repo`)
2. **Cek tools** — Git & Node.js, install jika belum ada
3. **Password** — Cek `passwd`, set jika belum
4. **Output** — Tampilkan username & IP untuk koneksi PC

### PC Side (`termux-connect-pc connection`)

1. **First run detection** — Cek `~/.config/termux-connecting/config`
2. **Input** — Alias, username, IP
3. **Connectivity check** — Key-based → password (sshpass) → manual
4. **SSH key setup** — Generate & copy key biar tanpa password
5. **SSH config** — Buat alias di `~/.ssh/config`
6. **Telegram (opsional)** — First run only, simpan bot token & chat ID

## Flow Check

### PC Side (`termux-connect-pc check`)

1. **SSH test** — `timeout 10 ssh -o BatchMode=yes $HOST_ALIAS "echo connected"`
2. **If OK** — Tampilkan info, tawarkan cron
3. **If GAGAL** — Kirim Telegram alert → tawarkan retry

## Telegram Alert

- Bot token & chat ID disimpan di `~/.config/termux-connecting/config`
- Hanya di-set saat first run `connection`
- Admin = user pertama yang setup Telegram
- Pesan dikirim via `https://api.telegram.org/bot{TOKEN}/sendMessage`

## Config File

Lokasi: `~/.config/termux-connecting/config`

```bash
HOST_ALIAS="termux-a8star"
SSH_USER="u0_a237"
SSH_HOST="192.168.1.8"
SSH_PORT=8022
TELEGRAM_BOT_TOKEN="123456:ABC-DEF1234"
TELEGRAM_CHAT_ID="@ariska138"
```

## Timeout Policy

| Operasi | Timeout |
|---------|---------|
| SSH key-based | 10 detik |
| SSH password | 10 detik |
| ssh-copy-id | 15 detik |
| curl download | 15s connect / 60s total |
| pkg update/upgrade | 300 detik |
| git clone | 120 detik |
