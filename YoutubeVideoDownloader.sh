#!/bin/bash

mkdir vid
cd vid
mv ../rename.py ../main.py ../info.txt ../url.txt .
python main.py
vid_title=$(echo $(cat info.txt))
url=$(echo $(cat url.txt))
echo $url
#ffmpeg -i "${url}" -b:v 100k -c:a aac -c:v libx264 "${vid_title}.mp4"
ffmpeg -i "https://backup.blackporn24.com/remote_control.php?time=1726504840&cv=024ba65ecf32560b0f7bd40e1570096a&lr=0&cv2=65573b77279b13d46bc3e706135dcd03&file=%2Fvideos%2F5000%2F5184%2F5184.mp4&cv3=06acca556021536eb8d13c95b0e4bf6a&cv4=29f45b3a064e65bd67ae10bf1349b755" -b:v 100k -c:a aac -c:v libx264 "leena.mp4"
#ffmpeg -i "${url}" -vf "scale=1280:720" -b:v 100k -c:v libx264 -preset veryfast -crf 23 -c:a aac -b:a 64k "${vid_title}.mp4"
python rename.py

cd ..
