# Troubleshooting

## SSH Connection Refused

**Error:** `ssh: connect to host 192.168.1.8 port 8022: Connection refused`

**Penyebab:** SSH server (sshd) tidak berjalan di Termux.

**Solusi:**
```bash
# Di Termux, jalankan:
sshd

# Cek apakah sudah jalan:
ps aux | grep sshd
```

## Connection Timeout

**Error:** `ssh: connect to host 192.168.1.8 port 8022: Operation timed out`

**Penyebab:**
1. HP dan PC tidak dalam jaringan WiFi yang sama
2. IP address salah
3. Firewall memblokir port 8022

**Solusi:**
```bash
# Di Termux, cek IP:
ip a | grep inet

# Cek koneksi dari PC:
ping 192.168.1.8
```

## pkg update/upgrade Gagal

**Error:** Repository does not have stable release

**Penyebab:** Repository Termux tidak stabil.

**Solusi:**
```bash
termux-change-repo
# Pilih mirror yang stabil (misal: SF)
```

## sshpass Not Found

**Error:** `command not found: sshpass`

**Solusi:**
```bash
# Mac:
brew install hudochenkov/sshpass/sshpass

# Linux:
apt install sshpass
```

## Telegram Alert Tidak Terkirim

**Penyebab:**
1. Bot token salah
2. Chat ID salah
3. Tidak ada koneksi internet di PC

**Solusi:**

Cek konfigurasi:
```bash
cat ~/.config/termux-connecting/config
```

Test kirim manual:
```bash
curl -s -X POST https://api.telegram.org/bot{TOKEN}/sendMessage \
  -d chat_id={CHAT_ID} \
  -d text="Test dari termux-connect-pc"
```

## SSH Key Copy Gagal

**Error:** `ssh-copy-id: ERROR: No identities found`

**Solusi:**
```bash
# Generate key dulu:
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""

# Copy manual:
ssh-copy-id -p 8022 u0_a237@192.168.1.8
```

## Permission Denied (publickey)

**Error:** `u0_a237@192.168.1.8: Permission denied (publickey)`

**Penyebab:** Public key belum terdaftar di `~/.ssh/authorized_keys` di Termux.

**Solusi:**
```bash
# Di Termux, cek authorized_keys:
cat ~/.ssh/authorized_keys

# Copy ulang dari PC:
ssh-copy-id -p 8022 u0_a237@192.168.1.8
```
