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

## 4. Cleaning Protocol
- **Safety First:** NEVER delete a file without checking if it's a core CMS file (WordPress/Laravel).
- **Manual Review:** Use `head -n 20 <file>` to inspect the code before cleaning.
- **De-activation:** Instead of deleting, rename to `.file.bak` or comment out the malicious line using `sed`.

## 5. Token-Efficient Workflow
1. **Identify:** Run a broad `grep` for keywords.
2. **Isolate:** Get the exact file paths.
3. **Inspect:** Use `sed -n 'X,Yp'` to read only the lines surrounding the match.
4. **Clean:** Apply a surgical `sed` replacement if the injection is in a valid file.
