vidName="vid"
mkdir myMusic/
pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl
cd myMusic
echo /////////////
echo $vidName
echo /////////////
url="https://youtube.com/playlist?list=PLK3Jf2YakZU9d6j1hsXh7GmQUBesJeKVk&si=EyQThxfZp9jmaw3S"
#echo "vidName=$(youtube-dl -f 18 -o '%(id)s.%(ext)s' --print-json --no-warnings "$url" | jq -r .title)"|tr ' ' '_'|tr '|' '_'|tr ':' '_'|tr '*' '_'|tr '>' '_'|tr '<' '_' > $GITHUB_ENV
#echo "vidName=$(youtube-dl -x -o '%(id)s.%(ext)s' --print-json --no-warnings --audio-format mp3 "$url" | jq -r .title)"|tr ' ' '_'|tr '|' '_'|tr ':' '_' > $GITHUB_ENV
ls -lh
echo "vidName=$(youtube-dl -J --flat-playlist "$url"| jq -r .title)"|tr ' ' '_'|tr '"' "_"|tr ':' '_' >> $GITHUB_ENV
youtube-dl --yes-playlist -f 18 "$url"
echo $vidname
ls

cd ..
mv myMusic "$vidName"
ls
zip -r "$vidName".zip "$vidName"/
