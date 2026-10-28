#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 04
# Topic: If-Else Conditional Statements
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 04   "
echo "  If-Else Conditional Statements     "
echo "====================================="
echo ""

# --- 1. Check Positive, Negative or Zero ---
echo -n "Enter a number: "
read num

if [ $num -gt 0 ]; then
    echo "$num is Positive."
elif [ $num -lt 0 ]; then
    echo "$num is Negative."
else
    echo "The number is Zero."
fi

echo ""

# --- 2. Even or Odd ---
if [ $(( num % 2 )) -eq 0 ]; then
    echo "$num is Even."
else
    echo "$num is Odd."
fi

echo ""

# --- 3. Largest of three numbers ---
echo -n "Enter three numbers (space-separated): "
read x y z

if [ $x -ge $y ] && [ $x -ge $z ]; then
    echo "Largest = $x"
elif [ $y -ge $x ] && [ $y -ge $z ]; then
    echo "Largest = $y"
else
    echo "Largest = $z"
fi

echo ""

# --- 4. Leap Year Check ---
echo -n "Enter a year: "
read year

if (( year % 400 == 0 )) || (( year % 4 == 0 && year % 100 != 0 )); then
    echo "$year is a Leap Year."
else
    echo "$year is NOT a Leap Year."
fi

echo ""
echo "Program 04 complete."
