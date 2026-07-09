#!/data/data/com.termux/files/usr/bin/bash
#
# termux-connecting — Installer via curl
# Usage: curl -fsSL https://raw.githubusercontent.com/Ariska138/termux-connecting/main/install.sh | bash

set -e

REPO="https://github.com/Ariska138/termux-connecting"
INSTALL_DIR="$HOME/.termux-connecting"
BIN_DIR="$PREFIX/bin"

echo "━━━ TERMUX CONNECTING — Installer ━━━"
echo ""

# Cek apakah di Termux
if [ ! -d "$PREFIX" ]; then
    echo "[✗] Script ini harus dijalankan di Termux."
    exit 1
fi

# Cek & install git
if ! command -v git; then
    echo "[*] Git belum terinstall. Install dulu..."
    pkg install -y git
fi

# Clone atau pull repo
if [ -d "$INSTALL_DIR" ]; then
    echo "[*] Update repo yang sudah ada..."
    cd "$INSTALL_DIR" && git pull
else
    echo "[*] Clone repo..."
    timeout 120 git clone --depth 1 "$REPO.git" "$INSTALL_DIR"
fi

# Buat symlink ke PATH
ln -sf "$INSTALL_DIR/bin/termux-connecting" "$BIN_DIR/termux-connecting"
chmod +x "$INSTALL_DIR/bin/termux-connecting"

echo ""
echo "[✓] Installasi selesai!"
echo ""
echo "  Jalankan: termux-connecting"
echo ""
