# Termux Connecting

CLI untuk setup Termux dan koneksi SSH dari PC/Mac — plus Telegram alert jika koneksi putus.

## Tutorial Lengkap

### 1. Install di Termux

Jalankan di HP (Termux):

```bash
pkg install -y nodejs-lts
npm i -g termux-connecting
```

Atau via curl installer (tanpa Node.js):

```bash
curl -fsSL https://raw.githubusercontent.com/Ariska138/termux-connecting/main/install.sh | bash
```

### 2. Setup Perangkat Termux

```bash
termux-connecting
```

Script akan melakukan:
1. `pkg update && pkg upgrade` — jika repo error, tawarkan ganti ke repo stable via `termux-change-repo`
2. Cek Git & Node.js — tawarkan install jika belum ada
3. Cek password SSH — jika belum, minta buat password baru via `passwd`
4. Tampilkan **Username** dan **IP Address** perangkat

Simpan info username dan IP yang muncul. Ini yang akan dipakai dari PC.

> **Sebelum lanjut**: pastikan SSH server sudah jalan di Termux:
> ```bash
> sshd
> ```
> Cek IP kapan saja: `ip a | grep inet`

### 3. Install & Koneksi dari PC/Mac

Di komputer, install:

```bash
npm i -g termux-connecting
```

Lalu jalankan:

```bash
termux-connect-pc
```

Karena pertama kali, akan masuk ke menu **connection**:

```
Nama alias [termux-a8star]:
Username [u0_a237]:
IP Address [192.168.1.8]:
```

Isi dengan username dan IP yang ditampilkan di langkah 2.

Script akan:
- Cek koneksi (key-based dulu, fallback ke password)
- Tawarkan buat SSH key agar koneksi tanpa password
- Buat SSH config alias
- **Hanya first run**: tawarkan setup **Telegram Alert**

#### Telegram Alert (opsional, first run saja)

```
Ingin dapat notifikasi Telegram saat koneksi bermasalah? [y/N]: y
Bot Token (dari @BotFather):
Chat ID (atau username @username):
```

Cara dapat token:
1. Buka Telegram, cari **@BotFather**
2. Kirim `/newbot`, ikuti petunjuk
3. Dapatkan token (format: `123456:ABC-DEF1234`)

Chat ID bisa diisi username Anda (misal `@ariska138`).

### 4. Cek Koneksi

```bash
termux-connect-pc check
```

Jika koneksi putus, script akan:
1. Kirim notifikasi ke Telegram admin
2. Tawarkan retry

## Subcommand Reference

```bash
termux-connect-pc connection    # Setup/ubah koneksi
termux-connect-pc check         # Cek koneksi & kirim alert
termux-connect-pc help          # Bantuan
termux-connect-pc version       # Versi
```

## Koneksi Manual via SSH

Setelah setup, cukup:
```bash
ssh termux-a8star
```

Atau manual:
```bash
ssh -p 8022 u0_a237@192.168.1.8
```

## Dokumentasi Detail

- [Architecture](docs/architecture.md) — System design, flow, timeout policy
- [Troubleshooting](docs/troubleshooting.md) — Common issues & solutions

## Lisensi

MIT
