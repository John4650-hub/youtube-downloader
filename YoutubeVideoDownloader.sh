vidName="vid"
mkdir myMusic/
pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl
cd myMusic
echo /////////////
echo $vidName
echo /////////////
echo "enter url to video or playlist: "
url="$(cat ../url__)"
echo "Enter pl(for playlist) or  vd(for video): "
fomat="$(cat ../fomat)"

if [[ "$fomat"=="vd" ]]; then
  echo "vidName=$(youtube-dl -f 18 -o 'vid1.mp4' --print-json --no-warnings "$url" | jq -r .title)"|tr ' ' '_'|tr '|' '_'|tr ':' '_'|tr '*' '_'|tr '>' '_'|tr '<' '_' > $GITHUB_ENV
  echo $GITHUB_ENV
  ffmpeg -i vid1.mp4 -b:v 100k -c:a copy -c:v libx264 -c:a aac "$GITHUB_ENV.mp4"
  rm vid1.mp4

fi
if [[ "$format" == "pl" ]]; then
  echo "vidName=$(youtube-dl -J --flat-playlist "$url"| jq -r .title)"|tr ' ' '_'|tr '"' "_"|tr ':' '_' >> $GITHUB_ENV
  youtube-dl --yes-playlist -f 18 "$url"
fi

ls -lh
ls

cd ..
mv myMusic "$vidName"
ls
zip -r "$vidName".zip "$vidName"/
