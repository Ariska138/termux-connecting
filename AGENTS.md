# AGENTS.md — termux-connecting

Project untuk setup Termux dan koneksi SSH dari PC/Mac.

## Dokumentasi

- [Architecture](docs/architecture.md) — System design & flow
- [Troubleshooting](docs/troubleshooting.md) — Common issues & solutions

## Binary

| Command | Platform | Fungsi |
|---------|----------|--------|
| `termux-connecting` | Termux | Setup device: update, git/node, passwd, lihat IP, akses online (--online) |
| `termux-connect-pc` | PC/Mac | Koneksi ke Termux: connection, check, help, version |

## Subcommand (PC)

```
termux-connect-pc connection    Setup/ubah koneksi
termux-connect-pc check         Cek koneksi & kirim alert Telegram
termux-connect-pc help          Bantuan
termux-connect-pc version       Versi
```

## Config

`~/.config/termux-connecting/config` — auto-generated, jangan commit.

## Versioning

Format: `Y.M.P`

- **Major**: Urutan tahun (1 = 2026, 2 = 2027, ...)
- **Minor**: Urutan bulan (1 = Juli 2026, 2 = Agustus 2026, ...)
- **Patch**: Hitungan publish di versi tersebut

### Publish

#### Persiapan

Token npm dengan bypass 2FA disimpan di `.env` (sudah di `.gitignore`):

```bash
source .env
npm set //registry.npmjs.org/:_authToken "$NPM_TOKEN"
```

Token berlaku ~90 hari. Jika kadaluarsa, generate baru di https://www.npmjs.com/settings/tokens
dengan tipe **Granular Access Token** → scope `termux-connecting` → **Read and write** →
centang **"Allow bypass 2FA"**, lalu update `.env`.

#### Jalankan

Cukup jalankan, semua otomatis:

```bash
npm publish
```

Alur:
1. `prepublishOnly` → `scripts/bump-version.sh`: hitung versi baru, update file, commit
2. `npm publish` → kirim ke registry
3. `postpublish` → `git push`

> **Catatan**: Jika gagal `403 Forbidden — Two-factor authentication required`,
> generate ulang token dengan bypass 2FA (lihat Persiapan di atas).

## Aturan

### Instalasi

| Metode | Platform | Command |
|--------|----------|---------|
| **npm global** | Termux & PC/Mac | `npm i -g termux-connecting` |
| **curl installer** | Termux (tanpa Node.js) | `curl -fsSL https://raw.githubusercontent.com/Ariska138/termux-connecting/main/install.sh \| bash` |
| **Manual** | Semua | `git clone https://github.com/Ariska138/termux-connecting.git && cd termux-connecting && ln -sf "\$PWD/bin/termux-connect-pc" /usr/local/bin/termux-connect-pc` |

### Publish

```bash
npm publish --otp=CODE
```

### Lainnya
- Jangan commit token/credential ke git
- Setiap perubahan harus update docs terkait
- Ikuti struktur subcommand yang sudah ada
