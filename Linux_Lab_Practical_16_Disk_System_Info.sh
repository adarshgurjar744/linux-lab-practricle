#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 16
# Topic: Disk & System Information
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 16   "
echo "  Disk & System Information          "
echo "====================================="
echo ""

# --- 1. OS / Kernel info ---
echo "--- OS & Kernel Information ---"
echo "Hostname       : $(hostname)"
echo "Kernel         : $(uname -r)"
echo "Architecture   : $(uname -m)"
echo "OS             : $(uname -o 2>/dev/null || uname -s)"
if [ -f /etc/os-release ]; then
    echo "Distribution   : $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
fi

# --- 2. CPU info ---
echo ""
echo "--- CPU Information ---"
if [ -f /proc/cpuinfo ]; then
    echo "CPU Model  : $(grep 'model name' /proc/cpuinfo | head -1 | cut -d: -f2 | xargs)"
    echo "CPU Cores  : $(grep -c 'processor' /proc/cpuinfo)"
    echo "CPU MHz    : $(grep 'cpu MHz' /proc/cpuinfo | head -1 | cut -d: -f2 | xargs)"
else
    echo "(CPU info not available)"
fi

# --- 3. Memory info ---
echo ""
echo "--- Memory Information ---"
if [ -f /proc/meminfo ]; then
    total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    free=$(grep MemFree /proc/meminfo | awk '{print $2}')
    avail=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
    printf "Total Memory  : %d MB\n" $(( total / 1024 ))
    printf "Free Memory   : %d MB\n" $(( free / 1024 ))
    printf "Available     : %d MB\n" $(( avail / 1024 ))
else
    free -h 2>/dev/null || echo "(Memory info not available)"
fi

# --- 4. Disk usage ---
echo ""
echo "--- Disk Usage ---"
df -hT 2>/dev/null || df -h

# --- 5. Disk partitions ---
echo ""
echo "--- Block Devices ---"
lsblk 2>/dev/null || fdisk -l 2>/dev/null | grep "^Disk" || echo "(lsblk not available)"

# --- 6. Network interfaces ---
echo ""
echo "--- Network Interfaces ---"
ip addr show 2>/dev/null | grep -E "^[0-9]+:|inet " | \
    awk '/^[0-9]+:/{iface=$2} /inet /{print "  "iface" -> "$2}' || \
ifconfig 2>/dev/null || echo "(ip/ifconfig not available)"

# --- 7. System load ---
echo ""
echo "--- System Load & Uptime ---"
uptime

# --- 8. Logged-in users ---
echo ""
echo "--- Logged-in Users ---"
who

echo ""
echo "Program 16 complete."
