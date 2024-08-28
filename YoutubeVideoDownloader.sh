#!/bin/bash

mkdir vid
cd vid
mv ../rename.py ../main.py ../info.txt ../url.txt .
python main.py
vid_title= echo $(cat info.txt)
url= echo $(cat url.txt)
ffmpeg -i "$url" -b:v 100k -c:a aac -c:v libx264 "${vid_title}.mp4"
python rename.py

cd ..
