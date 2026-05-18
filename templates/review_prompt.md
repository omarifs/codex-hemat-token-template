# REVIEW PROMPT - BUG/RISK FIRST

Review perubahan code berikut dengan fokus:
- Bug fungsional
- Regression risk
- Security issue
- Missing test

Aturan output:
1. Tampilkan temuan dulu (urut severity: High -> Medium -> Low)
2. Sertakan referensi file + line
3. Jika tidak ada temuan, tulis "No critical findings"
4. Ringkasan maksimal 5 bullet

Scope review:
- Path/files: `[ISI]`
- Diff/PR: `[ISI]`
- Constraint domain: `[ISI]`
