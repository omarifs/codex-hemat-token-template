# AGENT: CPanel User-Level Malware Scanner (Non-Root)

This manual is for scanning and cleaning malware (specifically gambling/judi injections) in environments where only standard SSH access is available.

## 1. Detection Strategy (Zero-Install)
The agent must rely on built-in Linux binaries (`grep`, `find`, `sed`) to identify threats without installing new packages.

## 2. Targeted Malware Patterns
The agent should look for these specific signatures:

| Type | Pattern / Keyword |
| :--- | :--- |
| **Gambling (Judi)** | `slot`, `gacor`, `jackpot`, `maxwin`, `zeus`, `togel`, `bandar` |
| **PHP Backdoors** | `eval(base64_decode`, `gzinflate(str_rot13`, `shell_exec(`, `$_POST['password']` |
| **Redirects** | `header("Location: http`, `window.location.href`, `RewriteRule` in .htaccess |

## 3. The "Zero-Install" Scanner Script
The agent should execute this logic directly via SSH:

```bash
#!/bin/bash
# Portable Scanner for CPanel User
SEARCH_PATH="public_html"
REPORT="malware_report.txt"

echo "--- Scanning for Suspicious Patterns ---" > $REPORT

# 1. Search for Gambling Keywords
grep -riE "slot|gacor|jackpot|zeus|togel|bandar|bola" $SEARCH_PATH >> $REPORT

# 2. Search for Obfuscated PHP
grep -riE "eval\(|base64_decode\(|gzinflate\(|str_rot13\(" $SEARCH_PATH | grep ".php" >> $REPORT

# 3. Search for Suspicious .htaccess redirects
find $SEARCH_PATH -name ".htaccess" -exec grep -H "RewriteRule.*http" {} \; >> $REPORT

# 4. Find files modified in the last 7 days
echo "--- Recently Modified Files ---" >> $REPORT
find $SEARCH_PATH -mtime -7 -type f >> $REPORT

echo "Scan complete. See $REPORT"
```

## 4. Reporting Protocol (Tech Support Role)
As technical support, the goal is to provide **evidence**, not to modify client files without consent.
- **Generate Evidence:** Always provide the exact file path and the line number of the suspicious content.
- **Snippet Collection:** Use `grep -C 2` to show the context (2 lines before/after) of the hit for the client's review.
- **Categorization:** Separate the report into "Likely Malware" (judi keywords) and "Suspicious Code" (obfuscated PHP).

## 5. Token-Efficient Workflow
1. **Identify:** Run `grep` to find suspicious patterns.
2. **Detail:** For each hit, show the client a 1-line snippet.
3. **Summarize:** Provide a total count of suspicious files.
4. **Handoff:** Present the `malware_report.txt` path to the client.
