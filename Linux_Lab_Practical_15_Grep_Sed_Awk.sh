#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 15
# Topic: Text Processing - grep, sed, awk
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 15   "
echo "  Text Processing: grep / sed / awk  "
echo "====================================="
echo ""

DATAFILE="/tmp/students.txt"

# Create a sample data file
cat > "$DATAFILE" <<EOF
Alice    CSE    85   A
Bob      ECE    72   B
Charlie  CSE    91   A+
Diana    MECH   60   C
Eve      CSE    78   B+
Frank    ECE    55   D
Grace    IT     88   A
Henry    MECH   45   F
Iris     IT     95   A+
Jack     CSE    68   C+
EOF

echo "--- Sample data file ---"
cat "$DATAFILE"
echo ""

# ============ GREP ============
echo "===== grep Examples ====="
echo ""

echo "1. Lines with 'CSE' students:"
grep "CSE" "$DATAFILE"

echo ""
echo "2. Lines NOT containing 'CSE' (-v):"
grep -v "CSE" "$DATAFILE"

echo ""
echo "3. Count of CSE students (-c):"
grep -c "CSE" "$DATAFILE"

echo ""
echo "4. Case-insensitive search for 'cse' (-i):"
grep -i "cse" "$DATAFILE"

echo ""
echo "5. Students with grade A+ (exact pattern):"
grep "A+$" "$DATAFILE"

# ============ SED ============
echo ""
echo "===== sed Examples ====="
echo ""

echo "6. Replace 'CSE' with 'Computer Science':"
sed 's/CSE/Computer Science/g' "$DATAFILE"

echo ""
echo "7. Delete lines containing 'MECH':"
sed '/MECH/d' "$DATAFILE"

echo ""
echo "8. Print lines 3 to 6:"
sed -n '3,6p' "$DATAFILE"

echo ""
echo "9. Add 'STUDENT: ' prefix to each line:"
sed 's/^/STUDENT: /' "$DATAFILE"

# ============ AWK ============
echo ""
echo "===== awk Examples ====="
echo ""

echo "10. Print only names (column 1):"
awk '{print $1}' "$DATAFILE"

echo ""
echo "11. Students with marks > 80:"
awk '$3 > 80 {print $1, $3}' "$DATAFILE"

echo ""
echo "12. Average marks:"
awk '{sum += $3} END {printf "Average Marks: %.2f\n", sum/NR}' "$DATAFILE"

echo ""
echo "13. Count per department:"
awk '{dept[$2]++} END {for (d in dept) print d": "dept[d]}' "$DATAFILE"

echo ""
echo "14. Formatted report:"
awk 'BEGIN {printf "%-10s %-6s %-5s %-4s\n","Name","Dept","Marks","Grade"; print "-----------------------------------"}
     {printf "%-10s %-6s %-5s %-4s\n", $1, $2, $3, $4}' "$DATAFILE"

# Cleanup
rm "$DATAFILE"
echo ""
echo "Program 15 complete."
