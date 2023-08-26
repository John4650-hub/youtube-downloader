
mkdir myMusic/
pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl
cd myMusic
echo /////////////
echo $vidName
echo /////////////
url=https://youtube.com/playlist?list=PL8JRTKSSfvuq_RvV4gIovCS0seiFynaQI&si=tAwCXcuxEA-gtGlD

echo "vidName=$(youtube-dl -J --flat-playlist "$url" | jq -r .title)"|tr ' ' '_' >> $GITHUB_ENV
echo $vidname
youtube-dl -f 17 --playlist-items 0-33 "$url"
ls
cd ..

#youtube-dl -f 18 --playlist-items 0-33 https://youtube.com/playlist?list=PLK3Jf2YakZU98E_ia8q2n2-XXpf8vH98W 
#youtube-dl -f 18 https://youtu.be/A1UDtFqDL48 
