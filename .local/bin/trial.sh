#!/bin/sh

SCRIPT_DIR="./colorscripts"  # change this to your scripts folder

for script in "$SCRIPT_DIR"/*; do
  if [ -x "$script" ]; then      # only run if executable
    echo "Running: $(basename "$script")"
    "$script"
    echo ""                     # blank line for readability
  else
    echo "Skipping non-executable: $(basename "$script")"
  fi
done

