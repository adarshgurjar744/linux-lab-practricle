#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 19
# Topic: Signals, Traps & Error Handling
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 19   "
echo "  Signals, Traps & Error Handling    "
echo "====================================="
echo ""

# ============================================================
# PART A: Signal Reference
# ============================================================
echo "===== Common Linux Signals ====="
echo "  SIGHUP  (1)  - Hangup (terminal closed)"
echo "  SIGINT  (2)  - Interrupt (Ctrl+C)"
echo "  SIGQUIT (3)  - Quit (Ctrl+\\)"
echo "  SIGKILL (9)  - Kill (cannot be caught or ignored)"
echo "  SIGTERM (15) - Graceful termination (default kill)"
echo "  SIGSTOP (19) - Stop process (cannot be caught)"
echo "  SIGCONT (18) - Continue stopped process"
echo "  SIGUSR1 (10) - User-defined signal 1"
echo "  SIGUSR2 (12) - User-defined signal 2"

echo ""
echo "Signal list (kill -l):"
kill -l 2>/dev/null

# ============================================================
# PART B: Trap command
# ============================================================
echo ""
echo "===== Trap Examples ====="

TMPFILE="/tmp/trap_demo.tmp"

# Cleanup function
cleanup() {
    echo ""
    echo "[TRAP] Cleanup triggered. Removing temp file..."
    rm -f "$TMPFILE"
    echo "[TRAP] Cleanup done. Exiting."
    exit 0
}

# Trap SIGINT (Ctrl+C) and SIGTERM
trap cleanup SIGINT SIGTERM

# Trap on EXIT (always runs at script end)
trap 'echo "[EXIT TRAP] Script is ending."' EXIT

echo "PID of this script: $$"
echo "Temp file: $TMPFILE"
touch "$TMPFILE"
echo "Temp file created. Press Ctrl+C to trigger trap, or wait 5 seconds..."

# Simulate work with countdown
for i in {5..1}; do
    echo -n "  $i..."
    sleep 1
done
echo ""

# ============================================================
# PART C: Error handling with set -e and trap ERR
# ============================================================
echo ""
echo "===== Error Handling ====="

# Trap any error
handle_error() {
    local line=$1
    echo "[ERROR] An error occurred on line $line."
}

trap 'handle_error $LINENO' ERR

# Function with deliberate error check
safe_divide() {
    local a=$1
    local b=$2
    if [ "$b" -eq 0 ]; then
        echo "Error: Division by zero!" >&2
        return 1
    fi
    echo "Result: $(( a / b ))"
}

echo "10 / 2 = $(safe_divide 10 2)"
safe_divide 5 0 || echo "Caught the error gracefully."

# ============================================================
# PART D: Exit codes
# ============================================================
echo ""
echo "===== Exit Codes ====="
echo "  0   = Success"
echo "  1   = General error"
echo "  2   = Misuse of shell builtin"
echo "  126 = Command not executable"
echo "  127 = Command not found"
echo "  128+N = Fatal signal N received"

# Check last exit code
ls /nonexistent_path 2>/dev/null
echo "Exit code of last command: $?"

# Remove trap before clean exit
trap - EXIT
echo ""
echo "Program 19 complete."
