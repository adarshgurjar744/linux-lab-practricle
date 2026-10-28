#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 03
# Topic: Arithmetic Operations
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 03   "
echo "  Arithmetic Operations              "
echo "====================================="
echo ""

echo -n "Enter first number : "
read a
echo -n "Enter second number: "
read b

# Using expr
sum=$(expr $a + $b)
diff=$(expr $a - $b)
prod=$(expr $a \* $b)

echo ""
echo "Using expr:"
echo "  $a + $b = $sum"
echo "  $a - $b = $diff"
echo "  $a * $b = $prod"

# Division (check divide by zero)
if [ $b -ne 0 ]; then
    div=$(expr $a / $b)
    mod=$(expr $a % $b)
    echo "  $a / $b = $div"
    echo "  $a % $b = $mod"
else
    echo "  Division by zero is not allowed."
fi

# Using $(( ))
echo ""
echo "Using \$(( )):"
echo "  $a + $b = $(( a + b ))"
echo "  $a - $b = $(( a - b ))"
echo "  $a * $b = $(( a * b ))"
echo "  $a ^ 2  = $(( a ** 2 ))"

# Floating point using bc
echo ""
echo "Using bc (floating point):"
echo "  $a / $b = $(echo "scale=4; $a / $b" | bc)"
echo "  sqrt($a) = $(echo "scale=4; sqrt($a)" | bc)"

echo ""
echo "Program 03 complete."
