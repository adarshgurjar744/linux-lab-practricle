#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 10
# Topic: Case Statement (Switch-Case)
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 10   "
echo "  Case Statement                     "
echo "====================================="
echo ""

# --- 1. Day of the week ---
echo -n "Enter day number (1-7): "
read day

case $day in
    1) echo "Monday"    ;;
    2) echo "Tuesday"   ;;
    3) echo "Wednesday" ;;
    4) echo "Thursday"  ;;
    5) echo "Friday"    ;;
    6) echo "Saturday"  ;;
    7) echo "Sunday"    ;;
    *) echo "Invalid day number." ;;
esac

# --- 2. Simple menu ---
echo ""
echo "==============================="
echo "       MAIN MENU               "
echo "==============================="
echo "  1. Print current date"
echo "  2. Print current user"
echo "  3. Print hostname"
echo "  4. Print uptime"
echo "  5. Exit"
echo "==============================="
echo -n "Choose an option: "
read choice

case $choice in
    1) date ;;
    2) echo "User: $USER" ;;
    3) hostname ;;
    4) uptime ;;
    5) echo "Exiting..." ;;
    *) echo "Invalid option." ;;
esac

# --- 3. File extension detector ---
echo ""
echo -n "Enter a filename (with extension): "
read fname

ext="${fname##*.}"    # extract extension

case "$ext" in
    sh)          echo "It is a Shell Script file."    ;;
    py)          echo "It is a Python file."          ;;
    c)           echo "It is a C source file."        ;;
    cpp|cxx|cc)  echo "It is a C++ source file."     ;;
    java)        echo "It is a Java source file."     ;;
    txt)         echo "It is a plain Text file."      ;;
    pdf)         echo "It is a PDF document."         ;;
    jpg|jpeg|png|gif) echo "It is an Image file."    ;;
    *)           echo "Unknown file type: .$ext"      ;;
esac

echo ""
echo "Program 10 complete."
