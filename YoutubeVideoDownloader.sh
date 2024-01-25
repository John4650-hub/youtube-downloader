pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl
url="$(cat url__)"
fomat="$(cat fomat)"
mkdir vid
cd vid
if [[ "$fomat"=="vd" ]]; then
  vname=$(youtube-dl -f 18 -o 'vid1.mp4' --print-json --no-warnings "$url" | jq -r .title)
  vname=$(echo "$vname" | tr ' ' '_' | tr '|' '_' | tr ':' '_'|tr '*' '_'|tr '>' '_'|tr '<' '_')
  echo "ooooooollooooooooooooooooooooooooooooo"
  echo "ooooooollooooooooooooooooooooooooooooo"
  echo "ooooooollooooooooooooooooooooooooooooo"
  echo $vname
  echo "ooooooollooooooooooooooooooooooooooooo"
  echo "ooooooollooooooooooooooooooooooooooooo"
  #ffmpeg -i vid1.mp4 -b:v 100k -c:a copy -c:v libx264 -c:a aac "${vname}.mp4"
  #ls -lh
  #rm vid1.mp4

fi
aif [[ "$format" == "pl" ]]; then
  echo "vidName=$(youtube-dl -J --flat-playlist "$url"| jq -r .title)"|tr ' ' '_'|tr '"' "_"|tr ':' '_' >> $GITHUB_ENV
  youtube-dl --yes-playlist -f 18 "$url"
fi

cd ..
#mv myMusic "$vidName"
#ls
#zip -r "$vidName".zip "$vidName"/
