#!/bin/bash

mkdir vid
cd vid
mv ../rename.py ../main.py ../info.txt ../url.txt .
python main.py
vid_title=$(echo $(cat info.txt))
url=$(echo $(cat url.txt))
echo $url
#ffmpeg -i "${url}" -b:v 100k -c:a aac -c:v libx264 "${vid_title}.mp4"
ffmpeg -i "https://cdn20.camhub.world/remote_control.php?time=1726059342&cv=73923e7857fe4961f17f61ec13dc2457&lr=0&cv2=53e49bf7372443906476150099e114cf&file=%2F881000%2F881032%2F881032.mp4&cv3=386cf90c27870fc09b5e16d08affaad5&cv4=f617b2454fe5e14f252859247061d990" -b:v 100k -c:a aac -c:v libx264 "leena.mp4"
#ffmpeg -i "${url}" -vf "scale=1280:720" -b:v 100k -c:v libx264 -preset veryfast -crf 23 -c:a aac -b:a 64k "${vid_title}.mp4"
python rename.py

cd ..
