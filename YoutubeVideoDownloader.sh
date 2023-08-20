
mkdir myMusic/
pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl
cd myMusic
echo /////////////
echo $vidName
echo /////////////

vidName=youtube-dl --get-filename -f 18 https://youtu.be/tPEE9ZwTmy0
echo /////////////
echo $vidName
echo /////////////


#youtube-dl -f 18 --playlist-items 0-33 https://youtube.com/playlist?list=PLK3Jf2YakZU98E_ia8q2n2-XXpf8vH98W 
#youtube-dl -f 18 https://youtu.be/A1UDtFqDL48 
cd ..
zip -r myMusic.zip myMusic/
