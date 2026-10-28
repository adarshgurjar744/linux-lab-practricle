#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 01
# Topic: Hello World & Basic Output
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 01   "
echo "  Hello World & Basic Output         "
echo "====================================="
echo ""

# Basic echo
echo "Hello, World!"

# Echo with escape sequences
echo -e "Hello\tWorld"        # tab
echo -e "Line1\nLine2"        # newline

# Print without newline
echo -n "No newline here -> "
echo " (continues on same line)"

# Using printf
printf "Name: %-10s Age: " "Alice" 22
printf "Name: %-10s Age: " "Bob"   25

echo ""
echo "Program 01 complete."
