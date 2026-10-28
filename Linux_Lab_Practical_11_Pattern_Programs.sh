#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 11
# Topic: Pattern Printing Programs
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 11   "
echo "  Pattern Printing Programs          "
echo "====================================="
echo ""

echo -n "Enter number of rows: "
read n

# --- 1. Right-angle triangle of stars ---
echo ""
echo "--- Pattern 1: Right Triangle ---"
for (( i=1; i<=n; i++ )); do
    for (( j=1; j<=i; j++ )); do
        echo -n "* "
    done
    echo ""
done

# --- 2. Inverted right triangle ---
echo ""
echo "--- Pattern 2: Inverted Triangle ---"
for (( i=n; i>=1; i-- )); do
    for (( j=1; j<=i; j++ )); do
        echo -n "* "
    done
    echo ""
done

# --- 3. Number triangle ---
echo ""
echo "--- Pattern 3: Number Triangle ---"
for (( i=1; i<=n; i++ )); do
    for (( j=1; j<=i; j++ )); do
        echo -n "$j "
    done
    echo ""
done

# --- 4. Pyramid ---
echo ""
echo "--- Pattern 4: Pyramid ---"
for (( i=1; i<=n; i++ )); do
    # Print spaces
    for (( j=i; j<n; j++ )); do
        echo -n "  "
    done
    # Print stars
    for (( j=1; j<=(2*i-1); j++ )); do
        echo -n "* "
    done
    echo ""
done

# --- 5. Diamond ---
echo ""
echo "--- Pattern 5: Diamond ---"
# Upper half
for (( i=1; i<=n; i++ )); do
    for (( j=i; j<n; j++ )); do echo -n " "; done
    for (( j=1; j<=(2*i-1); j++ )); do echo -n "*"; done
    echo ""
done
# Lower half
for (( i=n-1; i>=1; i-- )); do
    for (( j=n; j>i; j-- )); do echo -n " "; done
    for (( j=1; j<=(2*i-1); j++ )); do echo -n "*"; done
    echo ""
done

echo ""
echo "Program 11 complete."
