# Codex Hemat Token Template

Template ini membantu Anda memakai Codex/agent coding lain dengan biaya token lebih hemat saat membuat atau memperbaiki script.

## Tujuan
- Menurunkan token input/output tanpa menurunkan kualitas hasil.
- Menstandarkan cara memberi instruksi agar agent langsung eksekusi.
- Bisa dipakai lintas tools: Codex CLI, ChatGPT, Cursor, Cline, Windsurf, dll.

## Struktur
- `templates/system_prompt.md` : instruksi global reusable.
- `templates/task_prompt.md` : template permintaan kerja harian.
- `templates/review_prompt.md` : template review bug/risk.
- `templates/commit_prompt.md` : template ringkas sebelum commit.
- `templates/app_build_prompt.md` : template build aplikasi dari nol (bertahap).
- `templates/app_feature_batch_prompt.md` : template batch fitur kecil per request.
- `templates/quick_start_snippet.md` : snippet super-singkat untuk awal sesi.
- `TOKEN_RULES.md` : aturan praktis hemat token.
- `examples/request_examples.md` : contoh pemakaian.
- `AGENTS.md` : instruksi default untuk Codex.
- `GEMINI.md` : instruksi default untuk Gemini CLI.

## Cara Pakai Cepat
1. Tempel `templates/system_prompt.md` sebagai instruksi tetap (jika tool mendukung).
2. Untuk tiap task, copy `templates/task_prompt.md` lalu isi bagian `[ISI]`.
3. Jika butuh code review, pakai `templates/review_prompt.md`.
4. Batasi scope file dan acceptance criteria agar agent tidak melebar.
5. Untuk bikin aplikasi dari nol, mulai dari `templates/app_build_prompt.md` (fase 1-4).
6. Lanjut implementasi fitur pakai `templates/app_feature_batch_prompt.md` (1 batch = 1 fitur).

## Konfigurasi Codex dan Gemini
- Codex membaca `AGENTS.md`.
- Gemini CLI membaca `GEMINI.md`.
- Untuk repo lain, salin dua file itu ke root project target agar instruksinya ikut terbawa.
- Jika Anda ingin instruksi global, letakkan salinan di home directory tool masing-masing.
- Gunakan template ini sebagai dasar, lalu sesuaikan per stack project yang Anda kerjakan.
- Gemini CLI di repo ini juga memakai [.gemini/settings.json](/A:/laragon/www/codex-hemat-token-template/.gemini/settings.json) sebagai konfigurasi aktif.
- Rekomendasi mode kerja dan model ada di [AI_OPERATION_GUIDE.md](/A:/laragon/www/codex-hemat-token-template/AI_OPERATION_GUIDE.md).

## Preset Siap Pakai
- `presets/laravel/AGENTS.md` dan `presets/laravel/GEMINI.md` untuk Laravel/PHP.
- `presets/node/AGENTS.md` dan `presets/node/GEMINI.md` untuk Node/TypeScript.
- `presets/docs/AGENTS.md` dan `presets/docs/GEMINI.md` untuk dokumentasi atau repo prompt.
- `presets/SERVER_DEPLOYER.md` untuk arsitektur server high-concurrency (SPMB Case).
- `presets/MALWARE_SCANNER.md` dan `presets/CPANEL_USER_SCANNER.md` untuk deteksi malware.
- Salin preset yang sesuai ke repo target sebagai `AGENTS.md` atau `GEMINI.md`.

## Case Study: SPMB High-Concurrency (10k Users)
Proyek ini mencakup optimasi server terdistribusi:
1. **Web Server:** cPanel + Nginx Proxy + PHP-FPM Ondemand.
2. **Database Server:** MariaDB Dedicated (Private IP).
3. **Optimasi:** Kernel sysctl tuning, Nginx Micro-caching, dan CSF Firewall hardening.
Panduan lengkap ada di file `final-optimization-scripts.md` (lokal).

## Satu Perintah
- Dari repo target, jalankan:
  - `A:/laragon/www/codex-hemat-token-template/ai.cmd`
- Untuk paksa profile:
  - `A:/laragon/www/codex-hemat-token-template/ai.cmd -Profile laravel`
- Untuk pasang juga konfigurasi global:
  - `A:/laragon/www/codex-hemat-token-template/ai.cmd -InstallGlobal`
- Untuk bikin alias PowerShell `ai` dan `ai-setup`:
  - `A:/laragon/www/codex-hemat-token-template/install-alias.cmd`
- Untuk setup awal yang paling mudah diingat:
  - `A:/laragon/www/codex-hemat-token-template/setup.cmd`
- Setelah itu cukup ketik:
  - `ai`
  - `ai-setup`

## Mulai Cepat
- Baca [RUN_ME_FIRST.md](/A:/laragon/www/codex-hemat-token-template/RUN_ME_FIRST.md) kalau hanya ingin perintah inti tanpa penjelasan.
- Lihat [PORTABLE_PACKAGE.md](/A:/laragon/www/codex-hemat-token-template/PORTABLE_PACKAGE.md) kalau ingin tahu file minimal yang perlu ikut saat dipindah ke repo lain.
- Untuk membangun folder paket siap salin, jalankan:
  - `A:/laragon/www/codex-hemat-token-template/build-package.cmd`
- Kalau ingin ikut preset stack-specific:
  - `A:/laragon/www/codex-hemat-token-template/build-package.cmd -IncludePresets`
- Untuk ringkasan satu layar, buka [FINAL_USAGE.md](/A:/laragon/www/codex-hemat-token-template/FINAL_USAGE.md).
- Untuk struktur final file, buka [FINAL_STRUCTURE.md](/A:/laragon/www/codex-hemat-token-template/FINAL_STRUCTURE.md).

## Prinsip Kunci
- Beri konteks minimal yang cukup, bukan semua konteks.
- Selalu sebut file target, expected output, dan batasan.
- Minta format jawaban ringkas dan actionable.
- Hindari pertanyaan terbuka yang memicu eksplorasi panjang.

## Siap Jadi Repo GitHub
```bash
cd A:/laragon/www/codex-hemat-token-template
git init
git add .
git commit -m "feat: add reusable token-efficient codex templates"
git branch -M main
git remote add origin https://github.com/<username>/codex-hemat-token-template.git
git push -u origin main
```

## Lisensi
Gunakan bebas untuk internal tim. Tambahkan `LICENSE` jika ingin open-source.
