#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 07
# Topic: Arrays in Shell Scripting
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 07   "
echo "  Arrays in Shell Scripting          "
echo "====================================="
echo ""

# --- 1. Declare and access array ---
fruits=("Apple" "Banana" "Cherry" "Date" "Elderberry")

echo "--- Fruits Array ---"
echo "First element  : ${fruits[0]}"
echo "Third element  : ${fruits[2]}"
echo "All elements   : ${fruits[@]}"
echo "Total elements : ${#fruits[@]}"

# --- 2. Loop through array ---
echo ""
echo "--- Looping through array ---"
for fruit in "${fruits[@]}"; do
    echo "  Fruit: $fruit"
done

# --- 3. Array with indices ---
echo ""
echo "--- Array with indices ---"
for i in "${!fruits[@]}"; do
    echo "  Index $i -> ${fruits[$i]}"
done

# --- 4. Add and remove elements ---
echo ""
fruits+=("Fig")
echo "After adding Fig: ${fruits[@]}"

unset fruits[1]        # remove Banana
echo "After removing index 1: ${fruits[@]}"

# --- 5. Associative array (key-value) ---
echo ""
echo "--- Associative Array (dictionary) ---"
declare -A student
student["name"]="Alice"
student["age"]=21
student["branch"]="CSE"

echo "Name   : ${student[name]}"
echo "Age    : ${student[age]}"
echo "Branch : ${student[branch]}"

echo ""
echo "--- All keys & values ---"
for key in "${!student[@]}"; do
    echo "  $key = ${student[$key]}"
done

# --- 6. Numeric array: sum ---
echo ""
numbers=(10 20 30 40 50)
total=0
for n in "${numbers[@]}"; do
    total=$(( total + n ))
done
echo "Sum of ${numbers[@]} = $total"

echo ""
echo "Program 07 complete."
