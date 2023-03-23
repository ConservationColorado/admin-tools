#!/bin/bash

# This script accepts three arguments:
#   1. a path to the file to modify
#   2. a path for the new file
#   3. a set of strings to filter out of the original file
if [ $# -lt 3 ]; then
  echo "Error: Please provide the input file path, the output file path, and at least one string to filter out."
  echo "Usage: <input_file> <output_file> [\"pattern1\", \"pattern2\" ...]"
  exit 1
fi

input_file="$1"
output_file="$2"

# Join the remaining arguments, which are the patterns to match, into a single string with '|' as the separator
patterns=""
for pattern in "${@:3}"; do
  patterns+="|$pattern"
done
patterns=${patterns:1}

# Filter out lines that match any of the given patterns
grep -Ev "$patterns" "$input_file" > "$output_file"

