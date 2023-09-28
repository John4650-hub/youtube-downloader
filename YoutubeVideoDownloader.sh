
mkdir myMusic/
pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl
cd myMusic
echo /////////////
echo $vidName
echo /////////////
url="https://youtu.be/L3PMWMKI0YU?si=g_4D-LC-64vbuJ7Z"
echo "vidName=$(youtube-dl -f 18 -o '%(id)s.%(ext)s' --print-json --no-warnings "$url" | jq -r .title)"|tr ' ' '_' >> $GITHUB_ENV

#youtube-dl -f 18 "$url"
#echo "vidName=$(youtube-dl -J --flat-playlist "$url "| jq -r .title)"|tr ' ' '_' >> $GITHUB_ENV
echo $vidname
ls

cd ..
#youtube-dl -f 18 https://youtu.be/A1UDtFqDL48 
