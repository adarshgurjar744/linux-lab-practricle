#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 02
# Topic: Variables & User Input
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 02   "
echo "  Variables & User Input             "
echo "====================================="
echo ""

# Declaring variables
name="Alice"
age=21
gpa=8.75

echo "Name : $name"
echo "Age  : $age"
echo "GPA  : $gpa"

# Read input from user
echo ""
echo -n "Enter your name: "
read user_name

echo -n "Enter your age : "
read user_age

echo ""
echo "Hello, $user_name! You are $user_age years old."

# Readonly variable
readonly PI=3.14159
echo ""
echo "Value of PI = $PI"

# Unset a variable
temp_var="I will be removed"
echo "Before unset: $temp_var"
unset temp_var
echo "After unset : $temp_var"   # prints empty

# Special variables
echo ""
echo "Script name   : $0"
echo "PID           : $$"
echo "No. of args   : $#"

echo ""
echo "Program 02 complete."
