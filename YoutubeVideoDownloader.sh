#!/bin/bash

mkdir vid
cd vid
mv ../rename.py ../main.py ../info.txt ../url.txt .
#python main.py
vid_title=$(echo $(cat info.txt))
url=$(echo $(cat url.txt))
echo $url
ffmpeg -i "https://www.savepin.app/force-save.php?url=https%3A%2F%2Fv1.pinimg.com%2Fvideos%2Fmc%2F720p%2F6d%2F78%2F0c%2F6d780c8e356cd8a9f9ef1b44e6ca40c1.mp4" -b:v 300k -c:a aac -c:v libx264 "beast.mp4"
#ffmpeg -i "${url}" -vf "scale=1280:720" -b:v 100k -c:v libx264 -preset veryfast -crf 23 -c:a aac -b:a 64k "${vid_title}.mp4"
python rename.py

cd ..
