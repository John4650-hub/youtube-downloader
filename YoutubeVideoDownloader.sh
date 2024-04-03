#!/bin/bash

# Install youtube-dl
pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl

# Read URL and format from files
url="$(cat url__)"
format="$(cat format)" # Corrected variable name here
echo "d1"
# Create directory for videos and enter it
mkdir vid
cd vid

echo "d2"
if [[ "$format" == "vd" ]]; then
    # Process for a single video
    vid_info=$(youtube-dl -f 18 -o '%(title)s.%(ext)s' --print-json --no-warnings "$url")
    vid_title=$(echo $vid_info | jq -r .title | tr '+|:*' '____')
    vid_ext=$(echo $vid_info | jq -r .ext)

    # Rename and convert the video
    #ffmpeg -i "${vid_title}.${vid_ext}" -b:v 100k -c:a aac -c:v libx264 "${vid_title}_formatted.mp4"
    #rm "${vid_title}.${vid_ext}"
elif [[ "$format" == "pl" ]]; then
    # Process for a playlist
    youtube-dl -f 18 -o '%(title)s.%(ext)s' --yes-playlist "$url"
    for file in *; do
      echo "here"
        if [[ -f "$file" ]]; then
            base_name=$(basename "$file" .${file##*.})
            # Ensure the filename is safe
            safe_name=$(echo $base_name | tr '+|:*' '____')
            # Convert and rename the video
            #ffmpeg -i "$file" -b:v 100k -c:a aac -c:v libx264 "${safe_name}_formatted.mp4"
            #rm "$file"
        fi
    done
fi

cd ..
