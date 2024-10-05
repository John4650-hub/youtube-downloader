#!/bin/bash

mkdir vid
cd vid
mv ../rename.py ../main.py ../info.txt ../url.txt .
#python main.py
vid_title=$(echo $(cat info.txt))
url=$(echo $(cat url.txt))
echo $url
ffmpeg -i "https://www.savepin.app/force-save.php?url=https%3A%2F%2Fv1.pinimg.com%2Fvideos%2Fmc%2F720p%2F3e%2F60%2F4e%2F3e604ebbcc15538907eb269d93908de8.mp4" -b:v 200k -c:a aac -c:v libx264 "beast.mp4"
#ffmpeg -i "${url}" -vf "scale=1280:720" -b:v 100k -c:v libx264 -preset veryfast -crf 23 -c:a aac -b:a 64k "${vid_title}.mp4"
python rename.py

cd ..
