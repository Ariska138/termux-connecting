#!/usr/bin/env bash
if [ "$npm_config_global" != "true" ]; then
    exit 0
fi

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  termux-connecting berhasil diinstall!${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

echo -e "${CYAN}Di Termux:${NC}"
echo "  termux-connecting"
echo "  Setup perangkat: update paket, install tools, set password, lihat IP."
echo ""

echo -e "${CYAN}Di PC/Mac:${NC}"
echo "  termux-connect-pc"
echo "  Koneksi ke Termux: input IP/user/pass, setup SSH key, Telegram alert."
echo ""

echo -e "${YELLOW}Subcommand PC:${NC}"
echo "  termux-connect-pc connection    Setup/ubah koneksi"
echo "  termux-connect-pc check         Cek koneksi & kirim alert Telegram"
echo "  termux-connect-pc help          Bantuan"
echo "  termux-connect-pc version       Versi"
echo ""

echo -e "${GREEN}Selamat menggunakan!${NC}"
echo ""
