#!/bin/bash

mkdir vid
cd vid
mv ../rename.py ../main.py ../info.txt ../url.txt .
#python main.py
vid_title=$(echo $(cat info.txt))
url=$(echo $(cat url.txt))
echo $url
ffmpeg -i "https://rr1---sn-4g5edndz.googlevideo.com/videoplayback?expire=1728246503&ei=h54CZ6nrE6rn6dsPqYfnmQI&ip=85.234.161.1&id=o-AFdGSvlGNdp6Xv15VFuO3tvP6ytzPB5Smoby0eogn3Ez&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&mh=tL&mm=31%2C29&mn=sn-4g5edndz%2Csn-4g5lznl6&ms=au%2Crdu&mv=m&mvi=1&pl=19&initcwndbps=19881250&bui=AXLXGFTA-Lx-PJA0eCFYfwj6eittO_6-TkFe8R-coN58ZBRbjyZ2IHMKw8Jeb3hy_J8Rp-vGk0Pv6TVD&spc=54Mbxcug791wFGLei-B9D5HkjqsvB-qOn5dkYLcQ2TET1W5UkQ&vprv=1&svpuc=1&mime=video%2Fmp4&ns=bquypRyPo4g4eTBqQJzGMiAQ&rqh=1&cnr=14&ratebypass=yes&dur=42304.760&lmt=1666497627074594&mt=1728224485&fvip=1&fexp=51300760&c=WEB&sefc=1&txp=5538434&n=USNVLHh2S-8hkA&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cbui%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cns%2Crqh%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRgIhAIdhyiiByzrfCipOhWa9U47Q47tCq6iLACUvDPWw2a5SAiEA33K79kNfkaTKDww886rbGHD-GPWsvJY3lKlKihtD2ic%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=ACJ0pHgwRgIhAPKLrb3d6mGQuM7PlwAwlThmsxV6a8zjJuN-9QpCHZc2AiEAyMEqmlG8SkWzDigA9IFhsolXiuAb8UPNCGKsqmRkOG0%3D" -ss 00:00:01 -to 00:01:00 -b:v 50k -c:a aac -c:v libx264 "beast.mp4"
#ffmpeg -i "${url}" -vf "scale=1280:720" -b:v 100k -c:v libx264 -preset veryfast -crf 23 -c:a aac -b:a 64k "${vid_title}.mp4"
python rename.py

cd ..
