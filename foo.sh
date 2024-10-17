#!/bin/bash

# Install requests library (this line should be outside the script)
pip install requests

# Read video title and URL from respective files
python main.py
vid_title=$(< info.txt)
url=$(< url.txt)

# Execute Python script
python rd.py

# Read and validate `tm` from JSON, assuming foo.json contains a simple number
tm=$(< foo.json)
stp=$((tm - tm))
tm=26
# Check if `tm` is a number within the range 0 to 840
if ! [[ "$tm" =~ ^[0-9]+$ ]] || [[ "$tm" -lt 0 ]] || [[ "$tm" -gt 840 ]]; then
    echo "Error: tm in foo.json is not a valid number between 0 and 840."
    exit 1
fi

# Create directory and navigate into it
mkdir vid
cd vid

# Extract a frame starting at tm minutes
# The -ss option should be placed before -i for faster seeking
ffmpeg -i "$url" -ss "$((tm * 60 - 10))" -to "$((tm * 60))" -b:v 50k -c:a aac -c:v libx264 "beast.mp4"

# Increment `tm` by 5 and save it back to foo.json
echo $((tm + 25)) > ../foo.json

# Navigate back to the initial directory
cd ..

# Execute main Python script
python update.py
