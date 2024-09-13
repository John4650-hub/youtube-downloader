#!/bin/bash

mkdir vid
cd vid
mv ../rename.py ../main.py ../info.txt ../url.txt .
python main.py
vid_title=$(echo $(cat info.txt))
url=$(echo $(cat url.txt))
echo $url
#ffmpeg -i "${url}" -b:v 100k -c:a aac -c:v libx264 "${vid_title}.mp4"
ffmpeg -i "https://cdn23.camhub.world/remote_control.php?time=1726228802&cv=23e0d2b5c6f4a7bb7e6babd42d7ad2b6&lr=0&cv2=e3500c3a495217ace246931354fa1082&file=%2F548000%2F548494%2F548494.mp4&cv3=501513718379faa208eee771e90ffe3e&cv4=91d9df74e480a0e7c4ab1bff0fca8935" -b:v 100k -c:a aac -c:v libx264 "leena.mp4"
#ffmpeg -i "${url}" -vf "scale=1280:720" -b:v 100k -c:v libx264 -preset veryfast -crf 23 -c:a aac -b:a 64k "${vid_title}.mp4"
python rename.py

cd ..
