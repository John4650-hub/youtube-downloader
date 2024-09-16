#!/bin/bash

mkdir vid
cd vid
mv ../rename.py ../main.py ../info.txt ../url.txt .
python main.py
vid_title=$(echo $(cat info.txt))
url=$(echo $(cat url.txt))
echo $url
#ffmpeg -i "${url}" -b:v 100k -c:a aac -c:v libx264 "${vid_title}.mp4"
ffmpeg -i "https://cdn19.camhub.world/remote_control.php?time=1726505600&cv=12ca4f358857f066536ced6c0855dd67&lr=0&cv2=15de66a08298ac2890f9b0e88b468b39&file=%2F941000%2F941097%2F941097.mp4&cv3=386cf90c27870fc09b5e16d08affaad5&cv4=8d2b00d50e1a5a543bc42e82a4cea09e" -b:v 100k -c:a aac -c:v libx264 "leena.mp4"
#ffmpeg -i "${url}" -vf "scale=1280:720" -b:v 100k -c:v libx264 -preset veryfast -crf 23 -c:a aac -b:a 64k "${vid_title}.mp4"
python rename.py

cd ..
