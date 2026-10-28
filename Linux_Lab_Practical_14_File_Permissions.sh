#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 14
# Topic: File Permissions & Ownership
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 14   "
echo "  File Permissions & Ownership       "
echo "====================================="
echo ""

TMPDIR="/tmp/perm_lab"
mkdir -p "$TMPDIR"

# --- 1. Create test files ---
echo "--- Creating test files in $TMPDIR ---"
touch "$TMPDIR/file1.txt"
touch "$TMPDIR/file2.sh"
touch "$TMPDIR/file3.conf"
echo "Files created."

# --- 2. View permissions ---
echo ""
echo "--- Default permissions ---"
ls -l "$TMPDIR"

# --- 3. chmod symbolic mode ---
echo ""
echo "--- chmod: symbolic mode ---"
chmod u+x "$TMPDIR/file2.sh"
chmod g-w "$TMPDIR/file1.txt"
chmod o-r "$TMPDIR/file3.conf"
ls -l "$TMPDIR"

# --- 4. chmod numeric (octal) mode ---
echo ""
echo "--- chmod: octal mode ---"
chmod 755 "$TMPDIR/file2.sh"
chmod 644 "$TMPDIR/file1.txt"
chmod 600 "$TMPDIR/file3.conf"
ls -l "$TMPDIR"

# --- 5. Explain permission bits ---
echo ""
echo "--- Permission Breakdown ---"
for f in "$TMPDIR"/*; do
    perms=$(stat -c "%A" "$f")
    echo "  File: $(basename $f)  Permissions: $perms"
done

# --- 6. umask ---
echo ""
echo "--- Current umask ---"
umask

# --- 7. Special permissions ---
echo ""
echo "--- Setting SUID / SGID / Sticky bit ---"
chmod u+s "$TMPDIR/file2.sh"   2>/dev/null && echo "SUID set on file2.sh"
chmod g+s "$TMPDIR/file1.txt"  2>/dev/null && echo "SGID set on file1.txt"
chmod +t  "$TMPDIR"            2>/dev/null && echo "Sticky bit set on directory"
ls -l "$TMPDIR"

# --- 8. chown (show syntax – requires root to execute) ---
echo ""
echo "--- chown syntax examples ---"
echo "  sudo chown alice:alice file1.txt        # change owner & group"
echo "  sudo chown -R alice:devteam /project    # recursive"

# --- Cleanup ---
rm -rf "$TMPDIR"
echo ""
echo "Cleaned up $TMPDIR."

echo ""
echo "Program 14 complete."
