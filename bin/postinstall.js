#!/usr/bin/env node
var G = '\x1b[32m',
  Y = '\x1b[33m',
  C = '\x1b[36m',
  N = '\x1b[0m';
console.log(G + '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━' + N);
console.log(G + '  termux-connecting berhasil diinstall!' + N);
console.log(G + '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━' + N);
console.log('');
console.log(C + 'Di Termux:' + N);
console.log('  termux-connecting');
console.log('  Setup perangkat: update paket, install tools, set password, lihat IP.');
console.log('');
console.log(C + 'Di PC/Mac:' + N);
console.log('  termux-connect-pc');
console.log('  Koneksi ke Termux: input IP/user/pass, setup SSH key, Telegram alert.');
console.log('');
console.log(Y + 'Subcommand PC:' + N);
console.log('  termux-connect-pc connection    Setup/ubah koneksi');
console.log('  termux-connect-pc check         Cek koneksi & kirim alert Telegram');
console.log('  termux-connect-pc help          Bantuan');
console.log('  termux-connect-pc version       Versi');
console.log('');
console.log(G + 'Selamat menggunakan!' + N);
console.log('');
