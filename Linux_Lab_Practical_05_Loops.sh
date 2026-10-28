#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 05
# Topic: Loops - for, while, until
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 05   "
echo "  Loops: for / while / until         "
echo "====================================="
echo ""

# --- 1. for loop: print 1 to 10 ---
echo "--- for loop (1 to 10) ---"
for i in {1..10}; do
    echo -n "$i "
done
echo ""

# --- 2. for loop with C-style syntax ---
echo ""
echo "--- C-style for loop (squares of 1-5) ---"
for (( i=1; i<=5; i++ )); do
    echo "  $i^2 = $(( i * i ))"
done

# --- 3. while loop: countdown ---
echo ""
echo "--- while loop (countdown from 5) ---"
count=5
while [ $count -gt 0 ]; do
    echo -n "$count "
    count=$(( count - 1 ))
done
echo ""
echo "Blast off!"

# --- 4. until loop ---
echo ""
echo "--- until loop (print 1 to 5) ---"
n=1
until [ $n -gt 5 ]; do
    echo -n "$n "
    n=$(( n + 1 ))
done
echo ""

# --- 5. Multiplication table ---
echo ""
echo -n "Enter a number for multiplication table: "
read num
echo ""
echo "--- Multiplication Table of $num ---"
for (( i=1; i<=10; i++ )); do
    echo "  $num x $i = $(( num * i ))"
done

echo ""
echo "Program 05 complete."
