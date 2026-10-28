#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 09
# Topic: File Operations
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 09   "
echo "  File Operations                    "
echo "====================================="
echo ""

TESTFILE="/tmp/lab_testfile.txt"

# --- 1. Create / Write to a file ---
echo "Creating file: $TESTFILE"
cat > "$TESTFILE" <<EOF
Linux is a powerful open-source OS.
Shell scripting automates repetitive tasks.
File operations are essential in Linux.
Every line here is a record.
Practice makes perfect.
EOF
echo "File created."

# --- 2. Read file line by line ---
echo ""
echo "--- Contents of $TESTFILE ---"
while IFS= read -r line; do
    echo "  $line"
done < "$TESTFILE"

# --- 3. Count lines, words, characters ---
echo ""
lines=$(wc -l < "$TESTFILE")
words=$(wc -w < "$TESTFILE")
chars=$(wc -c < "$TESTFILE")
echo "Lines : $lines"
echo "Words : $words"
echo "Chars : $chars"

# --- 4. Append to file ---
echo ""
echo "Appending a new line..."
echo "This line was appended." >> "$TESTFILE"
echo "New line count: $(wc -l < "$TESTFILE")"

# --- 5. Search in file ---
echo ""
echo "--- Lines containing 'Linux' ---"
grep "Linux" "$TESTFILE"

# --- 6. File test operators ---
echo ""
echo "--- File Tests ---"
[ -f "$TESTFILE" ] && echo "It is a regular file."
[ -r "$TESTFILE" ] && echo "It is readable."
[ -w "$TESTFILE" ] && echo "It is writable."
[ -s "$TESTFILE" ] && echo "It is non-empty."

# --- 7. Copy, rename, delete ---
echo ""
COPYFILE="/tmp/lab_testfile_copy.txt"
cp "$TESTFILE" "$COPYFILE"
echo "Copied to $COPYFILE"

RENAMEFILE="/tmp/lab_testfile_renamed.txt"
mv "$COPYFILE" "$RENAMEFILE"
echo "Renamed copy to $RENAMEFILE"

rm "$RENAMEFILE"
echo "Deleted renamed file."

# --- 8. Cleanup ---
rm "$TESTFILE"
echo "Cleaned up test file."

echo ""
echo "Program 09 complete."
