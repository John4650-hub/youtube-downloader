#!/bin/bash

mkdir vid
cd vid
mv ../rename.py ../main.py ../info.txt ../url.txt .
#python main.py
vid_title=$(echo $(cat info.txt))
url=$(echo $(cat url.txt))
echo $url
ffmpeg -i "https://rr4---sn-4g5edns6.googlevideo.com/videoplayback?expire=1728238790&ei=ZoACZ4bIJOyWsvQP7vfN0Ac&ip=85.234.183.177&id=o-AOP8ftffgCWd7D2YC2Y1gNkr9qiBztY0L6vd9JBaPBZh&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&mh=1I&mm=31%2C26&mn=sn-4g5edns6%2Csn-f5f7lnl7&ms=au%2Conr&mv=m&mvi=4&pl=19&initcwndbps=3060000&bui=AXLXGFSz-k0MqtzXHWskJvIFoySNAsjKHfaVocVIBTi2sCB2hIg0dMhOpvX3sTFbG5Zz9LVAih221-CQ&spc=54MbxfnzMVpv_f3FlHF2LZj0Ek9jDhxSq3MzfA9WGYTA7w1-dA&vprv=1&svpuc=1&mime=video%2Fmp4&ns=2-szAmitvwbmWNpgtD9Ef9kQ&rqh=1&cnr=14&ratebypass=yes&dur=42899.191&lmt=1676493067590314&mt=1728216816&fvip=1&fexp=51300760&c=WEB&sefc=1&txp=7219224&n=ZPmeZaq5T6VLYg&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cbui%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cns%2Crqh%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRQIgG24clbeVNhFALQ11slFQGHupqmcQtTofKtyxxMoYtQ4CIQD2imr6KhdnjC7JlOI7-DMsollb1M8-1s1TqKYt1LMP0g%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=ACJ0pHgwRQIhAJ0QTakdYajfotXq3hk1Ay9lTrJbGEKG6PnreagthWqvAiBtT3aQEQAdi9rpPAuHze1Yw9IIFwgcIp7FE1smBbyJpA%3D%3D" -ss 00:00:01 -to 00:05:00 -b:v 50k -c:a aac -c:v libx264 "beast.mp4"
#ffmpeg -i "${url}" -vf "scale=1280:720" -b:v 100k -c:v libx264 -preset veryfast -crf 23 -c:a aac -b:a 64k "${vid_title}.mp4"
python rename.py

cd ..
