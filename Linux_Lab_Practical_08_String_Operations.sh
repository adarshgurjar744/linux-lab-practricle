#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 08
# Topic: String Operations
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 08   "
echo "  String Operations                  "
echo "====================================="
echo ""

str="Hello, Linux World!"

# --- 1. Length ---
echo "String        : $str"
echo "Length        : ${#str}"

# --- 2. Uppercase / Lowercase ---
echo "Uppercase     : ${str^^}"
echo "Lowercase     : ${str,,}"

# --- 3. Substring extraction ---
echo ""
echo "Substring (7,5): ${str:7:5}"     # starts at 7, length 5

# --- 4. Find and Replace ---
echo "Replace Linux : ${str/Linux/Unix}"
echo "Replace all o : ${str//o/0}"

# --- 5. Trim prefix / suffix ---
filename="report_2024.csv"
echo ""
echo "Filename      : $filename"
echo "Remove prefix : ${filename#report_}"     # remove shortest prefix
echo "Remove suffix : ${filename%.csv}"        # remove shortest suffix

# --- 6. String comparison ---
echo ""
s1="apple"
s2="orange"

if [ "$s1" == "$s2" ]; then
    echo "'$s1' and '$s2' are equal."
else
    echo "'$s1' and '$s2' are NOT equal."
fi

if [[ "$s1" < "$s2" ]]; then
    echo "'$s1' comes before '$s2' alphabetically."
else
    echo "'$s1' comes after '$s2' alphabetically."
fi

# --- 7. Check if string is empty ---
echo ""
empty_str=""
if [ -z "$empty_str" ]; then
    echo "String is empty."
fi

non_empty="Hello"
if [ -n "$non_empty" ]; then
    echo "String '$non_empty' is NOT empty."
fi

# --- 8. Concatenation ---
echo ""
first="Linux"
second=" Shell"
combined="$first$second"
echo "Concatenated : $combined"

# --- 9. Split string ---
echo ""
csv="one,two,three,four"
IFS=',' read -ra parts <<< "$csv"
echo "Split CSV string: '${csv}'"
for part in "${parts[@]}"; do
    echo "  -> $part"
done

echo ""
echo "Program 08 complete."
