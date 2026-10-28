#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 13
# Topic: User & Group Administration
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 13   "
echo "  User & Group Administration        "
echo "====================================="
echo ""

# --- 1. Current user details ---
echo "--- Current User Info ---"
echo "Username   : $(whoami)"
echo "UID        : $(id -u)"
echo "GID        : $(id -g)"
echo "Groups     : $(groups)"
echo "Home Dir   : $HOME"
echo "Login Shell: $SHELL"

# --- 2. All logged in users ---
echo ""
echo "--- Currently Logged-in Users ---"
who

# --- 3. Last logins ---
echo ""
echo "--- Last 5 Logins ---"
last -n 5 2>/dev/null || echo "(last command not available)"

# --- 4. List all users from /etc/passwd ---
echo ""
echo "--- System Users (from /etc/passwd) ---"
echo "UID >= 1000 (regular users):"
awk -F: '$3 >= 1000 && $3 < 65534 {printf "  %-15s UID:%-6s Home:%s\n", $1, $3, $6}' /etc/passwd

# --- 5. List all groups ---
echo ""
echo "--- Groups (first 10 from /etc/group) ---"
head -10 /etc/group | awk -F: '{printf "  Group: %-20s GID: %s\n", $1, $3}'

# --- 6. Check if user exists ---
echo ""
echo -n "Enter a username to check: "
read uname

if id "$uname" &>/dev/null; then
    echo "User '$uname' EXISTS."
    id "$uname"
else
    echo "User '$uname' does NOT exist."
fi

# --- 7. Password file info ---
echo ""
echo "--- Password aging info for current user ---"
chage -l "$(whoami)" 2>/dev/null || echo "(chage not available or insufficient privilege)"

echo ""
echo "Program 13 complete."
