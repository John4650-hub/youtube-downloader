
mkdir myMusic/
pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl
cd myMusic
echo /////////////
echo $vidName
echo /////////////
url="https://youtu.be/zBUqHW8RTH4?si=Lg799KWSIqqIlTjz"
#echo "vidName=$(youtube-dl -f 18 -o '%(id)s.%(ext)s' --print-json --no-warnings "$url" | jq -r .title)"|tr ' ' '_'|tr '|' '_'|tr ':' '_' >> $GITHUB_ENV
echo "vidName=$(youtube-dl -x --audio-format mp3 -o '%(id)s.%(ext)s' --print-json --no-warnings "$url" | jq -r .title)"|tr ' ' '_'|tr '|' '_'|tr ':' '_' >> $GITHUB_ENV

#youtube-dl -f 18 "$url"
#echo "vidName=$(youtube-dl -J --flat-playlist "$url "| jq -r .title)"|tr ' ' '_' >> $GITHUB_ENV
echo $vidname
ls

cd ..
#youtube-dl -f 18 https://youtu.be/A1UDtFqDL48 
