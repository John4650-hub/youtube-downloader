
mkdir myMusic/
pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl
cd myMusic
echo /////////////
echo $vidName
echo /////////////
url="https://youtube.com/playlist?list=PL8JRTKSSfvuqZwjDTvniu1iI2mfZw6mbw&si=v0Q9V_AI1IAltg2F"
#echo "vidName=$(youtube-dl -f 18 -o '%(id)s.%(ext)s' --print-json --no-warnings "$url" | jq -r .title)"|tr ' ' '_' >> $GITHUB_ENV

echo "vidName=$(youtube-dl -J --flat-playlist "$url" | jq -r .title)"|tr ' ' '_' >> $GITHUB_ENV
echo $vidname
ls

youtube-dl -f 18 --playlist-items "$url"
cd ..
#youtube-dl -f 18 https://youtu.be/A1UDtFqDL48 
