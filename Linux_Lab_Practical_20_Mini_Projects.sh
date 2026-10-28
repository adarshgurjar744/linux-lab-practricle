#!/bin/bash
# ============================================================
# Linux Lab Practical - Program 20
# Topic: Mini Projects & Capstone Programs
# ============================================================

echo "====================================="
echo "  Linux Lab Practical - Program 20   "
echo "  Mini Projects & Capstone Programs  "
echo "====================================="
echo ""

# ============================================================
# PROJECT 1: Simple Calculator
# ============================================================
calculator() {
    echo "==============================="
    echo "       SIMPLE CALCULATOR       "
    echo "==============================="
    echo -n "Enter first number : "; read n1
    echo -n "Enter operator (+,-,*,/,%): "; read op
    echo -n "Enter second number: "; read n2

    case $op in
        +) echo "Result: $(echo "$n1 + $n2" | bc)" ;;
        -) echo "Result: $(echo "$n1 - $n2" | bc)" ;;
        \*|x) echo "Result: $(echo "$n1 * $n2" | bc)" ;;
        /) 
           if [ "$n2" = "0" ]; then echo "Error: Divide by zero"
           else echo "Result: $(echo "scale=4; $n1 / $n2" | bc)"; fi ;;
        %) echo "Result: $(( ${n1%.*} % ${n2%.*} ))" ;;
        *) echo "Invalid operator." ;;
    esac
}

# ============================================================
# PROJECT 2: Number Guessing Game
# ============================================================
guessing_game() {
    echo "==============================="
    echo "     NUMBER GUESSING GAME      "
    echo "==============================="
    secret=$(( RANDOM % 100 + 1 ))
    attempts=0
    echo "I picked a number between 1 and 100. Can you guess it?"

    while true; do
        echo -n "Your guess: "; read guess
        attempts=$(( attempts + 1 ))

        if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
            echo "Please enter a valid number."
            continue
        fi

        if [ "$guess" -lt "$secret" ]; then
            echo "Too low! Try higher."
        elif [ "$guess" -gt "$secret" ]; then
            echo "Too high! Try lower."
        else
            echo "Correct! You guessed it in $attempts attempts."
            break
        fi
    done
}

# ============================================================
# PROJECT 3: Student Grade Manager
# ============================================================
grade_manager() {
    echo "==============================="
    echo "    STUDENT GRADE MANAGER      "
    echo "==============================="
    GRADEFILE="/tmp/grades.txt"
    > "$GRADEFILE"

    echo -n "How many students? "; read n
    for (( i=1; i<=n; i++ )); do
        echo -n "Student $i name: "; read sname
        echo -n "Marks (out of 100): "; read marks

        if   [ $marks -ge 90 ]; then grade="A+"
        elif [ $marks -ge 80 ]; then grade="A"
        elif [ $marks -ge 70 ]; then grade="B+"
        elif [ $marks -ge 60 ]; then grade="B"
        elif [ $marks -ge 50 ]; then grade="C"
        elif [ $marks -ge 40 ]; then grade="D"
        else                         grade="F"; fi

        echo "$sname $marks $grade" >> "$GRADEFILE"
    done

    echo ""
    echo "--- Grade Report ---"
    printf "%-15s %-6s %s\n" "Name" "Marks" "Grade"
    echo "----------------------------"
    while read name m g; do
        printf "%-15s %-6s %s\n" "$name" "$m" "$g"
    done < "$GRADEFILE"

    avg=$(awk '{sum+=$2} END{printf "%.2f", sum/NR}' "$GRADEFILE")
    pass=$(awk '$2>=40{c++} END{print c+0}' "$GRADEFILE")
    fail=$(awk '$2<40{c++} END{print c+0}' "$GRADEFILE")
    echo "----------------------------"
    echo "Average Marks : $avg"
    echo "Passed        : $pass"
    echo "Failed        : $fail"
    rm "$GRADEFILE"
}

# ============================================================
# PROJECT 4: System Health Monitor
# ============================================================
health_monitor() {
    echo "==============================="
    echo "    SYSTEM HEALTH MONITOR      "
    echo "==============================="
    echo "Time     : $(date)"
    echo "Hostname : $(hostname)"
    echo ""

    # CPU usage
    cpu=$(top -bn1 2>/dev/null | grep "Cpu(s)" | awk '{print $2}' | cut -d% -f1 || echo "N/A")
    echo "CPU Usage  : ${cpu}%"

    # RAM usage
    if [ -f /proc/meminfo ]; then
        total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
        avail=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
        used=$(( total - avail ))
        pct=$(( used * 100 / total ))
        echo "RAM Usage  : ${pct}% ($(( used/1024 )) MB used / $(( total/1024 )) MB total)"
    fi

    # Disk usage
    echo ""
    echo "Disk Usage:"
    df -h | grep -E "^/dev" | awk '{printf "  %-20s %s used of %s (%s)\n", $6, $3, $2, $5}'

    # Load average
    echo ""
    echo "Load Average: $(cat /proc/loadavg | cut -d' ' -f1-3)"

    # Top 3 memory-hungry processes
    echo ""
    echo "Top 3 Memory Processes:"
    ps aux --sort=-%mem 2>/dev/null | awk 'NR>1 && NR<=4 {printf "  %-20s %s%%\n", $11, $4}'
}

# ============================================================
# MAIN MENU
# ============================================================
while true; do
    echo ""
    echo "====================================="
    echo "         SELECT A PROJECT            "
    echo "====================================="
    echo "  1. Simple Calculator"
    echo "  2. Number Guessing Game"
    echo "  3. Student Grade Manager"
    echo "  4. System Health Monitor"
    echo "  5. Exit"
    echo "====================================="
    echo -n "Choice: "
    read choice

    case $choice in
        1) echo ""; calculator        ;;
        2) echo ""; guessing_game     ;;
        3) echo ""; grade_manager     ;;
        4) echo ""; health_monitor    ;;
        5) echo "Goodbye!"; break     ;;
        *) echo "Invalid choice."     ;;
    esac
done

echo ""
echo "Program 20 complete."
