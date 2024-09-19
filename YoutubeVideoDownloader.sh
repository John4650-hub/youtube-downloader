#!/bin/bash

mkdir vid
cd vid
mv ../rename.py ../main.py ../info.txt ../url.txt .
python main.py
vid_title=$(echo $(cat info.txt))
url=$(echo $(cat url.txt))
echo $url
#ffmpeg -i "${url}" -b:v 100k -c:a aac -c:v libx264 "${vid_title}.mp4"
ffmpeg -i "https://cdn13.camhub.world/remote_control.php?time=1726775900&cv=fd14993efd6bf0cf1b482cf601e56e35&lr=0&cv2=e549c2c71fff5a7ad8ff6f47ab4eead2&file=%2F243000%2F243913%2F243913_1080p.mp4&cv3=1b7de228214178ca953c6723a69be46a&cv4=2e977343b548a58d3b773ae5df453d70" -b:v 100k -c:a aac -c:v libx264 "leena.mp4"
#ffmpeg -i "${url}" -vf "scale=1280:720" -b:v 100k -c:v libx264 -preset veryfast -crf 23 -c:a aac -b:a 64k "${vid_title}.mp4"
python rename.py

cd ..
