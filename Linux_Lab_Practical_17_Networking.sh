#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 17
# Topic: Networking Commands & Scripting
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 17   "
echo "  Networking Commands & Scripting    "
echo "====================================="
echo ""

# --- 1. Hostname and IP ---
echo "--- Host Information ---"
echo "Hostname       : $(hostname)"
echo "FQDN           : $(hostname -f 2>/dev/null || hostname)"
echo "Short hostname : $(hostname -s 2>/dev/null || hostname)"

# --- 2. IP Addresses ---
echo ""
echo "--- IP Addresses ---"
ip addr show 2>/dev/null | grep -E "inet " | awk '{print "  "$2}' || \
    ifconfig 2>/dev/null | grep "inet " | awk '{print "  "$2}'

# --- 3. Default Gateway ---
echo ""
echo "--- Default Gateway ---"
ip route show default 2>/dev/null || route -n 2>/dev/null | grep "^0.0.0.0"

# --- 4. DNS servers ---
echo ""
echo "--- DNS Servers ---"
if [ -f /etc/resolv.conf ]; then
    grep "^nameserver" /etc/resolv.conf
else
    echo "(resolv.conf not found)"
fi

# --- 5. Ping test ---
echo ""
echo "--- Ping Test (google.com) ---"
if ping -c 3 -W 2 google.com &>/dev/null; then
    echo "google.com is reachable."
    ping -c 3 google.com
else
    echo "Cannot reach google.com (no internet or DNS issue)."
fi

# --- 6. Port check (using /dev/tcp) ---
echo ""
echo "--- Port Check ---"
check_port() {
    local host=$1
    local port=$2
    if (echo > /dev/tcp/$host/$port) &>/dev/null; then
        echo "  $host:$port is OPEN"
    else
        echo "  $host:$port is CLOSED or unreachable"
    fi
}
check_port "google.com" 80
check_port "google.com" 443
check_port "localhost"  22

# --- 7. Active connections ---
echo ""
echo "--- Active Network Connections ---"
ss -tuln 2>/dev/null | head -20 || netstat -tuln 2>/dev/null | head -20 || \
    echo "(ss/netstat not available)"

# --- 8. Traceroute ---
echo ""
echo "--- Traceroute to google.com (first 5 hops) ---"
traceroute -m 5 google.com 2>/dev/null || \
    tracepath -m 5 google.com 2>/dev/null || \
    echo "(traceroute not available)"

# --- 9. Network scan with ping sweep ---
echo ""
echo "--- Ping Sweep: 192.168.1.1 - 192.168.1.10 ---"
echo "(adjust subnet to your network)"
for ip in $(seq 1 10); do
    target="192.168.1.$ip"
    if ping -c 1 -W 1 "$target" &>/dev/null; then
        echo "  $target is UP"
    else
        echo "  $target is DOWN"
    fi
done

echo ""
echo "Program 17 complete."
