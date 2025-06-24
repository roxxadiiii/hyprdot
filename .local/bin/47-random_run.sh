#!/bin/bash

# Get a list of all scripts in the current folder
scripts=(/home/roxx/.local/bin/colorscripts/*)

# Get the total number of scripts
num_scripts=${#scripts[@]}

# Generate a random index
random_index=$((RANDOM % num_scripts))

# Execute the randomly selected script
bash "${scripts[$random_index]}"
