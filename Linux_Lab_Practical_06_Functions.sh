#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 06
# Topic: Functions in Shell Scripting
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 06   "
echo "  Functions in Shell Scripting       "
echo "====================================="
echo ""

# --- 1. Simple function ---
greet() {
    echo "Hello, $1! Welcome to Linux Lab."
}

greet "Alice"
greet "Bob"

# --- 2. Function with return value (via echo) ---
add() {
    local result=$(( $1 + $2 ))
    echo $result
}

sum=$(add 10 25)
echo ""
echo "Sum of 10 and 25 = $sum"

# --- 3. Factorial using recursion ---
factorial() {
    local n=$1
    if [ $n -le 1 ]; then
        echo 1
    else
        local prev=$(factorial $(( n - 1 )))
        echo $(( n * prev ))
    fi
}

echo ""
echo -n "Enter a number for factorial: "
read num
result=$(factorial $num)
echo "Factorial of $num = $result"

# --- 4. Function using global variable ---
counter=0
increment() {
    counter=$(( counter + 1 ))
}

echo ""
increment; increment; increment
echo "Counter after 3 increments = $counter"

# --- 5. Check if file exists (utility function) ---
check_file() {
    if [ -f "$1" ]; then
        echo "File '$1' exists."
    else
        echo "File '$1' does NOT exist."
    fi
}

echo ""
check_file "/etc/hostname"
check_file "/tmp/no_such_file.txt"

echo ""
echo "Program 06 complete."
