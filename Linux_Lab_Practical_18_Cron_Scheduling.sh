#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 18
# Topic: Cron Jobs & Task Scheduling
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 18   "
echo "  Cron Jobs & Task Scheduling        "
echo "====================================="
echo ""

# ============================================================
# PART A: Cron Expression Reference
# ============================================================
echo "===== Cron Expression Format ====="
echo ""
echo "  * * * * *  command"
echo "  | | | | |"
echo "  | | | | +-- Day of Week  (0-7, Sun=0 or 7)"
echo "  | | | +---- Month        (1-12)"
echo "  | | +------ Day of Month (1-31)"
echo "  | +-------- Hour         (0-23)"
echo "  +---------- Minute       (0-59)"
echo ""
echo "Examples:"
echo "  0  2  *  *  *    -> Run at 2:00 AM every day"
echo "  */5 *  *  *  *   -> Run every 5 minutes"
echo "  0  0  1  *  *    -> Run at midnight on the 1st of every month"
echo "  0  8  *  *  1    -> Run at 8 AM every Monday"
echo "  30 6  *  *  1-5  -> Run at 6:30 AM Mon-Fri"

# ============================================================
# PART B: View existing cron jobs
# ============================================================
echo ""
echo "===== Current User's Cron Jobs ====="
crontab -l 2>/dev/null || echo "(No cron jobs configured for $(whoami))"

echo ""
echo "===== System Cron Jobs (/etc/cron.d/) ====="
ls /etc/cron.d/ 2>/dev/null && cat /etc/cron.d/* 2>/dev/null | head -30 || \
    echo "(Cannot access /etc/cron.d/)"

# ============================================================
# PART C: Scheduled Task Script Example
# This script is meant to be saved and added to crontab
# ============================================================
echo ""
echo "===== Example Scheduled Task Script ====="

SCRIPT_PATH="/tmp/daily_report.sh"
cat > "$SCRIPT_PATH" <<'INNER_SCRIPT'
#!/bin/bash
# Daily system report - meant to be run by cron
LOGFILE="/tmp/daily_report_$(date +%Y%m%d).log"
{
    echo "=== Daily System Report ==="
    echo "Date     : $(date)"
    echo "Hostname : $(hostname)"
    echo "Uptime   : $(uptime)"
    echo ""
    echo "--- Disk Usage ---"
    df -h
    echo ""
    echo "--- Memory ---"
    free -h
    echo ""
    echo "--- Top 5 CPU Processes ---"
    ps aux --sort=-%cpu | head -6
} > "$LOGFILE"
echo "Report saved to $LOGFILE"
INNER_SCRIPT

chmod +x "$SCRIPT_PATH"
echo "Created example script: $SCRIPT_PATH"
echo ""

# Run it once to demonstrate
bash "$SCRIPT_PATH"

echo ""
echo "===== How to add to crontab ====="
echo "  Run: crontab -e"
echo "  Add this line to run daily at 6:00 AM:"
echo "  0 6 * * * /tmp/daily_report.sh"
echo ""
echo "  To remove: crontab -r"
echo "  To list  : crontab -l"

# ============================================================
# PART D: at command (one-time scheduling)
# ============================================================
echo ""
echo "===== One-time Scheduling with 'at' ====="
echo "  echo 'echo Hello > /tmp/at_test.txt' | at now + 1 minute"
echo "  atq         # list pending at jobs"
echo "  atrm <id>   # remove a scheduled job"

if command -v at &>/dev/null; then
    echo ""
    echo "'at' command is available."
    echo "echo 'echo Hello from at >> /tmp/at_test.txt' | at now + 1 minute 2>/dev/null" | bash
    echo "Job submitted. Check 'atq' for pending jobs."
    atq 2>/dev/null
else
    echo "'at' command is not installed."
fi

# Cleanup
rm -f "$SCRIPT_PATH"
echo ""
echo "Program 18 complete."
