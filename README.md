# Termux Connecting

CLI untuk mempermudah setup Termux dan koneksi SSH ke PC/Mac.

## Fitur

- Update & upgrade paket (dengan opsi ganti repo jika gagal)
- Cek & install Git dan Node.js
- Set password (passwd) untuk SSH
- Tampilkan username & IP untuk koneksi
- Panduan koneksi SSH

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

```bash
termux-connecting
```

Jalankan di Termux. Ikuti petunjuk di layar.

## Cara Koneksi dari PC/Mac

Pastikan HP dan PC terhubung ke jaringan WiFi yang sama, lalu:

```bash
ssh -p 8022 username@ip-android
```

## Lisensi

MIT
