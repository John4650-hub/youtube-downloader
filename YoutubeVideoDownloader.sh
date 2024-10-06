#!/bin/bash

mkdir vid
cd vid
mv ../rename.py ../main.py ../info.txt ../url.txt .
#python main.py
vid_title=$(echo $(cat info.txt))
url=$(echo $(cat url.txt))
echo $url
ffmpeg -i "https://rr1---sn-i5h7lnls.googlevideo.com/videoplayback?expire=1727751581&ei=PRH7ZpWZFqGO6dsPndSrmAY&ip=176.5.135.91&id=o-AEVulXvv0B_tMBbMbZnkqwkta7SHSZxqm7xJoG2E5ljc&itag=137&aitags=133%2C134%2C135%2C136%2C137%2C160%2C242%2C243%2C244%2C247%2C248%2C278%2C394%2C395%2C396%2C397%2C398%2C399&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&mh=_M&mm=31%2C26&mn=sn-i5h7lnls%2Csn-5goeenes&ms=au%2Conr&mv=m&mvi=1&pl=22&initcwndbps=1215000&bui=AXLXGFR096xf8ipzX_jIuUJynonLE5LcAMWV5PLwlyx4WK_oWEaMuP6mSHTWLQQrgSrTB0tGPL7eGIdS&spc=54MbxaUYvn7mL6UPQx2FtdLlBH9bw-b8BocjhZHhRk4Voi0mLw&vprv=1&svpuc=1&mime=video%2Fmp4&ns=A8RQi-4w7dMrMjfPQIgFeTwQ&rqh=1&gir=yes&clen=3138844973&dur=29636.299&lmt=1689580733763315&mt=1727729575&fvip=1&keepalive=yes&fexp=51299152&c=WEB&sefc=1&txp=5432434&n=m4n2AZGZHp_SmA&sparams=expire%2Cei%2Cip%2Cid%2Caitags%2Csource%2Crequiressl%2Cxpc%2Cbui%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cns%2Crqh%2Cgir%2Cclen%2Cdur%2Clmt&sig=AJfQdSswRQIgFZR4kZpXc4AuhbJd2-KialCv45NOKQbeUbL7hTtVJj0CIQDI1C0QXA6YFZWqkb7rS35O8QszijfnVa_jwbbnzSvmjw%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=ABPmVW0wRAIgHdLWJfyN_FPrcZF2gB_s_AswFW9FnzmL1d5-dj-8ii8CICwUQWBGBK2HPhw_4K602_AKT9WJeWxk8NL0-4JZNrKM" -ss 00:00:01 -to 00:01:00 -b:v 10k -c:a aac -c:v libx264 "beast.mp4"
#ffmpeg -i "${url}" -vf "scale=1280:720" -b:v 100k -c:v libx264 -preset veryfast -crf 23 -c:a aac -b:a 64k "${vid_title}.mp4"
python rename.py

cd ..
