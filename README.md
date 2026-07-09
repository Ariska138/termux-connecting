# Termux Connecting

CLI untuk mempermudah setup Termux dan koneksi SSH ke PC/Mac.

## Fitur

### Di Termux (`termux-connecting`)
- Update & upgrade paket (dengan opsi ganti repo jika gagal)
- Cek & install Git dan Node.js
- Set password (passwd) untuk SSH
- Tampilkan username & IP untuk koneksi
- Panduan koneksi SSH

### Di PC/Mac (`termux-connect-pc`)
- Deteksi otomatis host SSH dari `~/.ssh/config`
- Input manual username, IP, password
- Cek konektifitas (key-based atau password via sshpass)
- Setup SSH key untuk koneksi tanpa password
- Setup SSH config alias
- Setup Cloudflare Tunnel untuk koneksi online (opsional)

## Installasi

### Via npm

```bash
npm i -g termux-connecting
```

### Via curl

```bash
curl -fsSL https://github.com/Ariska138/termux-connecting/install.sh | bash
```

### Manual

```bash
git clone https://github.com/Ariska138/termux-connecting.git
cd termux-connecting
chmod +x bin/termux-connecting
cp bin/termux-connecting $PREFIX/bin/
```

## Usage

### Di Termux
```bash
termux-connecting
```

Setup perangkat Termux: update paket, install git/node, set password, lihat IP.

### Di PC/Mac
```bash
termux-connect-pc
```

Setup koneksi dari komputer ke Termux: input IP/username/password, setup SSH key, setup tunnel Cloudflare.

## Cara Koneksi dari PC/Mac

Pastikan HP dan PC terhubung ke jaringan WiFi yang sama, lalu:

```bash
ssh -p 8022 username@ip-android
```

Atau setelah setup SSH config:
```bash
ssh termux-a8star
```

### Via Cloudflare Tunnel (dari luar jaringan)

```bash
ssh -o ProxyCommand='cloudflared access ssh --hostname ssh.domain.com' termux-a8star
```

## Lisensi

MIT
