#!/bin/bash

# Function to open YouTube video in Tor browser for a specific time
play_youtube_in_tor() {
  local youtube_link=$1
  local play_time=$2

  echo "Opening YouTube video: $youtube_link"
  # Open Tor Browser instance with the YouTube link
  tor-browser --new-instance "$youtube_link" &

  # Get the process ID of Tor Browser (this assumes Tor browser binary is 'tor-browser')
  tor_pid=$!

  # Wait for the specified play time (in seconds)
  sleep "$play_time"

  # Close the Tor browser instance
  echo "Closing Tor Browser..."
  kill -9 $tor_pid
}

# Input variables
read -p "Enter YouTube video link: " youtube_link
read -p "Enter play time in seconds: " play_time
read -p "Enter number of repetitions: " repetitions

# Loop to repeat the process
for ((i = 1; i <= repetitions; i++)); do
  echo "Iteration $i of $repetitions"
  play_youtube_in_tor "$youtube_link" "$play_time"
done

echo "Process completed."
