
mkdir myMusic/
pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl
cd myMusic
echo /////////////
echo $vidName
echo /////////////
url="https://youtube.com/playlist?list=PLJ1odve0o6dX5ndJ5lwiCOR58ycB1rcrV&si=P3wVl-DWtkAi6dGL"
#echo "vidName=$(youtube-dl -f 18 -o '%(id)s.%(ext)s' --print-json --no-warnings "$url" | jq -r .title)"|tr ' ' '_' >> $GITHUB_ENV

youtube-dl -f 18 "$url"
echo "vidName=$(youtube-dl -J --flat-playlist "$url "| jq -r .title)"|tr ' ' '_' >> $GITHUB_ENV
echo $vidname
ls

cd ..
#youtube-dl -f 18 https://youtu.be/A1UDtFqDL48 
