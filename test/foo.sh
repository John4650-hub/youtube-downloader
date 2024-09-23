#!/bin/bash
mkdir vid
cd vid
vid_title=$(echo $(cat info.txt))
url=$(echo $(cat url.txt))
echo $url
#ffmpeg -i "${url}" -b:v 100k -c:a aac -c:v libx264 "${vid_title}.mp4"
#timeout 10s ffmpeg
#ffmpeg -i "$url" -vframes 1 "${vid_title}.jpg"
ffmpeg -ss 00:05:00 -i "$url" -frames:v 1 output.jpg
#ffmpeg -i "${url}" -vf "scale=1280:720" -b:v 100k -c:v libx264 -preset veryfast -crf 23 -c:a aac -b:a 64k "${vid_title}.mp4"
cd ..
