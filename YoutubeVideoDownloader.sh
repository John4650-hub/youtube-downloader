#!/bin/bash

mkdir vid
cd vid
mv ../rename.py ../main.py ../info.txt ../url.txt .
python main.py
vid_title=$(echo $(cat info.txt))
url=$(echo $(cat url.txt))
echo $url
#ffmpeg -i "${url}" -b:v 100k -c:a aac -c:v libx264 "${vid_title}.mp4"
ffmpeg -i "https://cdn19.camhub.world/remote_control.php?time=1726776748&cv=a29a69fa55b76da9dd6dbc1b64cd2d30&lr=0&cv2=0b3939b4d0218746ce8ba4219ccc1eda&file=%2F941000%2F941346%2F941346.mp4&cv3=386cf90c27870fc09b5e16d08affaad5&cv4=8d7cc38ec1b3324cb167c6b026300ac3" -b:v 100k -c:a aac -c:v libx264 "leena.mp4"
#ffmpeg -i "${url}" -vf "scale=1280:720" -b:v 100k -c:v libx264 -preset veryfast -crf 23 -c:a aac -b:a 64k "${vid_title}.mp4"
python rename.py

cd ..
