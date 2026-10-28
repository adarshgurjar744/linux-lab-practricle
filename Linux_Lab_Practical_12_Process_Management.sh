#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 12
# Topic: Process Management
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 12   "
echo "  Process Management                 "
echo "====================================="
echo ""

# --- 1. Current process info ---
echo "--- Current Process Information ---"
echo "Script PID    : $$"
echo "Parent PID    : $PPID"
echo "Current user  : $(whoami)"
echo "Shell         : $SHELL"

# --- 2. List top 10 processes by CPU ---
echo ""
echo "--- Top 10 Processes by CPU Usage ---"
ps aux --sort=-%cpu 2>/dev/null | head -11 || \
ps -e -o pid,comm,%cpu,%mem --sort=-%cpu | head -11

# --- 3. List top 10 processes by Memory ---
echo ""
echo "--- Top 10 Processes by Memory Usage ---"
ps aux --sort=-%mem 2>/dev/null | head -11 || \
ps -e -o pid,comm,%cpu,%mem --sort=-%mem | head -11

# --- 4. Find a process by name ---
echo ""
echo -n "Enter process name to search: "
read pname

echo "--- Processes matching '$pname' ---"
pgrep -la "$pname" 2>/dev/null || echo "No process found with name '$pname'."

# --- 5. Background and foreground processes ---
echo ""
echo "--- Running a background job ---"
sleep 5 &
bg_pid=$!
echo "Started 'sleep 5' in background with PID: $bg_pid"

echo "Current jobs:"
jobs

# Wait for background job
wait $bg_pid
echo "Background job $bg_pid finished."

# --- 6. Process priorities (nice) ---
echo ""
echo "--- Process Nice Values ---"
echo "Current shell nice value: $(nice)"

# --- 7. System uptime and load ---
echo ""
echo "--- System Uptime ---"
uptime

echo ""
echo "Program 12 complete."
