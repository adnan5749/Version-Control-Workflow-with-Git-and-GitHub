#!/usr/bin/env bash
# simple-interest.sh
# Usage: ./simple-interest.sh <principal> <rate_percent> <time_years>
# Example: ./simple-interest.sh 1000 5 2

set -euo pipefail

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <principal> <rate_percent> <time_years>"
  exit 1
fi

P="$1"
R="$2"
T="$3"

# Validate numeric input
re='^[0-9]+([.][0-9]+)?$'
for v in "$P" "$R" "$T"; do
  if ! [[ "$v" =~ $re ]]; then
    echo "Error: all inputs must be numeric (got '$v')."
    exit 2
  fi
done

SI=$(awk "BEGIN { printf(\"%.2f\", ($P * $R * $T) / 100 ) }")
Total=$(awk "BEGIN { printf(\"%.2f\", $P + $SI ) }")

echo "Principal (P): $P"
echo "Rate (R%):     $R"
echo "Time (T years): $T"
echo "Simple Interest: $SI"
echo "Total Amount:   $Total"
