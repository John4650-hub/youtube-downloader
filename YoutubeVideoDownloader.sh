#!/bin/bash

mkdir vid
cd vid
mv ../rename.py ../main.py ../info.txt ../url.txt .
#python main.py
vid_title=$(echo $(cat info.txt))
url=$(echo $(cat url.txt))

ffmpeg -i "${url}" -vf "scale=1280:720" -b:v 100k -c:v libx264 -preset veryfast -crf 23 -c:a aac -b:a 64k "${vid_title}.mp4"
python rename.py

cd ..
