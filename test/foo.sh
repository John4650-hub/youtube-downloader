#!/bin/bash

# Read video title and URL from respective files
vid_title=$(< info.txt)
url=$(< url.txt)

# Execute Python script
python rd.py

# Read and validate `tm` from JSON, assuming foo.json contains a simple number
tm=$(< foo.json)

# Check if `tm` is a number
if ! [[ "$tm" =~ ^([0-9]|[1-9][0-9]|[1-7][0-9]{2}|8[0-3][0-9]|840)$ ]]; then
  echo "Error: tm in foo.json is not a valid number."
  exit 1
fi

# Create directory and navigate into it
mkdir -p vid
cd vid || exit

# Extract a frame starting at tm minutes
ffmpeg -ss $((tm * 60)) -i "$url" -frames:v 1 output.jpg

# Increment `tm` by 5 and save it back to foo.json
echo $((tm + 5)) > ../foo.json

# Navigate back to the initial directory
cd ..

# Execute main Python script
python main.py
