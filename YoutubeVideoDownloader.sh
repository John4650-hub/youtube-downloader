vidName="vid"
mkdir myMusic/
pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl
cd myMusic
echo /////////////
echo $vidName
echo /////////////
url="https://youtu.be/A7PFDr9FPec"
echo "vidName=$(youtube-dl -f 18 -o '%(id)s.%(ext)s' --print-json --no-warnings "$url" | jq -r .title)"|tr ' ' '_'|tr '|' '_'|tr ':' '_'|tr '*' '_'|tr '>' '_'|tr '<' '_' > $GITHUB_ENV
#echo "vidName=$(youtube-dl -x -o '%(id)s.%(ext)s' --print-json --no-warnings --audio-format mp3 "$url" | jq -r .title)"|tr ' ' '_'|tr '|' '_'|tr ':' '_' > $GITHUB_ENV
ls -lh
#youtube-dl -f 18 "$url"
#echo "vidName=$(youtube-dl -J --flat-playlist "$url "| jq -r .title)"|tr ' ' '_'|tr '"' "_"|tr ':' '_' >> $GITHUB_ENV
echo $vidname
ls

cd ..
mv myMusic "$vidName"
ls
zip -r "$vidName".zip "$vidName"/
