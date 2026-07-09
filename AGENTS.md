# AGENTS.md — termux-connecting

Project untuk setup Termux dan koneksi SSH dari PC/Mac.

## Dokumentasi

- [Architecture](docs/architecture.md) — System design & flow
- [Troubleshooting](docs/troubleshooting.md) — Common issues & solutions

## Binary

| Command | Platform | Fungsi |
|---------|----------|--------|
| `termux-connecting` | Termux | Setup device: update, git/node, passwd, lihat IP |
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

## Aturan

- Jangan commit token/credential ke git
- Setiap perubahan harus update docs terkait
- Ikuti struktur subcommand yang sudah ada
