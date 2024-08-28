#!/bin/bash

# Install youtube-dl
pip install y2mate-api

# Read URL and format from files
url="$(cat url__)"
format="$(cat format)" # Corrected variable name here
echo "d1"
# Create directory for videos and enter it
mkdir vid
cd vid
mv ../rename.py .
echo "d2"
if [[ "$format" == "vd" ]]; then
    # Process for a single video
    vid_info=$(yt-dlp -f "mp4" "$url")
    ls -a
    #(yt-dlp --get-description --skip-download "$url")>../descript.txt
    #vid_title=$(echo $vid_info | jq -r .title | tr '+|:*' '____')
    #(echo "$vid_title")>../title.txt
    #vid_ext=$(echo $vid_info | jq -r .ext)

    # Rename and convert the video
    #ffmpeg -i "${vid_title}.${vid_ext}" -b:v 100k -c:a aac -c:v libx264 "${vid_title}_formatted.mp4"
    #rm "${vid_title}.${vid_ext}"
elif [[ "$format" == "pl" ]]; then
    # Process for a playlist
    (youtube-dl --flat-playlist --skip-download "$url") >> ../descript.txt
    (youtube-dl --get-filename -o "%(playlist_title)s - %(title)s - %(id)s" --flat-playlist --skip-download "$url") >> ../title.txt
    
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

elif [[ "$format" == "lst" ]]; then
    # Process for a single video or a list of videos
    while IFS= read -r url; do
    (youtube-dl --get-description --skip-download "$url")>>../descript.txt
        vid_info=$(youtube-dl -f 18 -o '%(title)s.%(ext)s' --print-json --no-warnings "$url")
        vid_title=$(echo $vid_info | jq -r .title | tr '+|:*' '____')
    (echo -e "$vid_title\n")>>../title.txt
	
        vid_ext=$(echo $vid_info | jq -r .ext)
      done < ../urls
fi

python rename.py

cd ..
