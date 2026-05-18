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

## Cara Pakai Cepat
1. Tempel `templates/system_prompt.md` sebagai instruksi tetap (jika tool mendukung).
2. Untuk tiap task, copy `templates/task_prompt.md` lalu isi bagian `[ISI]`.
3. Jika butuh code review, pakai `templates/review_prompt.md`.
4. Batasi scope file dan acceptance criteria agar agent tidak melebar.
5. Untuk bikin aplikasi dari nol, mulai dari `templates/app_build_prompt.md` (fase 1-4).
6. Lanjut implementasi fitur pakai `templates/app_feature_batch_prompt.md` (1 batch = 1 fitur).

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
