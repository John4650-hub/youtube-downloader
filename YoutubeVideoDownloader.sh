
mkdir myMusic/
pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl
cd myMusic
echo /////////////
echo $vidName
echo /////////////
url=https://youtube.com/playlist?list=PL8JRTKSSfvurh5Llw2DV6p4MDcVgVF0hA

echo "vidName=$(youtube-dl -f 18 --playlist-items 0-33 -o '%(id)s.%(ext)s' --print-json --no-warnings "$url" | jq -r .title)"|tr ' ' '_' >> $GITHUB_ENV
cd ..

#youtube-dl -f 18 --playlist-items 0-33 https://youtube.com/playlist?list=PLK3Jf2YakZU98E_ia8q2n2-XXpf8vH98W 
#youtube-dl -f 18 https://youtu.be/A1UDtFqDL48 
