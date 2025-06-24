#!/bin/bash

# Check if yt-dlp is installed
if ! command -v yt-dlp &> /dev/null; then
    echo "Error: yt-dlp is not installed. Please install it and try again."
    exit 1
fi

# Check if at least one URL is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <YouTube_URL> [<YouTube_URL> ...]"
    exit 1
fi

# Loop through all provided URLs
for url in "$@"; do
    echo "Downloading video from URL: $url"
    
    yt-dlp -o "%(title)s.%(ext)s" "$url"
    
    if [ $? -eq 0 ]; then
        echo "Download completed successfully for: $url"
    else
        echo "Failed to download video from: $url"
    fi
done

echo "All tasks completed."

