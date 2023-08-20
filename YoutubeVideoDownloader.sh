
mkdir myMusic/
pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl
cd myMusic
echo /////////////
echo ${{ env.vidName }}
echo /////////////
url=https://youtu.be/tPEE9ZwTmy0

vidName=$(youtube-dl -f mp4 -o '%(id)s.%(ext)s' --print-json --no-warnings "$url" | jq -r .title)
echo /////////////
echo $vidName
echo /////////////


#youtube-dl -f 18 --playlist-items 0-33 https://youtube.com/playlist?list=PLK3Jf2YakZU98E_ia8q2n2-XXpf8vH98W 
#youtube-dl -f 18 https://youtu.be/A1UDtFqDL48 
cd ..
zip -r myMusic.zip myMusic/
