# AGENT: Server Auto-Deployer & Optimizer

This manual empowers an AI agent to autonomously setup and optimize high-performance servers based on client specifications.

## 1. Initial Handshake & Login
To begin, the agent must identify the target servers.
- **Access Check:** Ask the client for the SSH Host entry (from `.ssh/config`) or `user@ip -p port`.
- **Connectivity:** Immediately run `ssh <host> "hostname; free -m; nproc"` to verify access and resources.

## 2. Resource-Based Optimization Formulas
The agent must use these formulas to prevent OOM (Out of Memory) crashes:

| Resource | Formula / Guideline |
| :--- | :--- |
| **PHP Workers** | `(Available_RAM - 4GB) / 50MB` |
| **DB Buffer Pool** | `75% of Total DB RAM` |
| **Max Connections** | `(Total_RAM_GB * 100)` or `5000` (cap) |
| **Nginx Workers** | `auto` (matches CPU cores) |

## 3. High-Concurrency Workflow (10k+ Users)

### Phase 1: Audit
- Check OS (Ubuntu/AlmaLinux preferred).
- Verify Stack (cPanel ea-nginx or Standalone Nginx).
- Check Private IP for distributed setups.

### Phase 2: Distributed Execution
If the client provides two servers, split the load:
- **Web Node:** Install `ea-nginx`, set PHP-FPM to `ondemand`, apply `sysctl` tweaks.
- **DB Node:** Install `mariadb-server`, bind to Private IP, apply memory tuning.

### Phase 3: Security
- Install and configure **CSF Firewall**.
- Whitelist IPs for inter-server communication.
- Disable `TESTING` mode after verification.

## 4. Automation Commands
The agent should prefer using the following "Master Logic":
1. **Sysctl Tweaks:** For handling massive TCP backlogs.
2. **Nginx Micro-caching:** For shielding PHP from repeated GET requests.
3. **Remote SQL Profile:** Linking cPanel to the dedicated DB node.

## 5. Verification Protocol
Before handing over to the client, run:
- [ ] `mysql -h <DB_IP> -u root -p -e "SELECT 1;"` (Connectivity)
- [ ] `nginx -t` (Nginx Syntax)
- [ ] `systemctl status ea-php*` (PHP Health)
- [ ] `tail -n 50 /var/log/nginx/error.log` (Error Check)

## 6. Anti-Hang Safety Mandates
- **NEVER** use `pm = static` for high concurrency on limited RAM.
- **ALWAYS** check `free -m` before and after service restarts.
- **LIMIT** PHP `memory_limit` to 512MB max per process.

## 7. Load Monitoring & Interpretation
The agent must proactively monitor server health during and after deployment.

### A. Core Thresholds
- **Load Average:** Must NOT exceed the number of CPU cores (`nproc`) for extended periods. 
    - *Example:* On an 8-core server, a load of 12.0 means the CPU is 150% saturated (dangerous).
- **Memory:** Available RAM should stay above 10% of total. If swap starts being used heavily, reduce PHP `max_children`.

### B. Diagnostic Commands
- **CPU/Load:** `top -b -n 1 | head -n 20` or `htop`.
- **Memory:** `free -m` (Focus on 'available', not 'free').
- **Disk I/O:** `iostat -xz 1 5` or `iotop` (Check for 'iowait' bottleneck).
- **PHP Health:** `php-fpm-status` (if enabled) to check active vs idle workers.

### C. Bottleneck Identification
1. **High Load + Low RAM:** Likely PHP `max_children` too high or memory leaks.
2. **High Load + High IOWait:** Likely Database queries missing indexes or slow disk.
3. **High Load + Low CPU Usage:** Likely network congestion or wait-locks in Database.
