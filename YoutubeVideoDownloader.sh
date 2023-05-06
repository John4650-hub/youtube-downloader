mkdir myMusic/
pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl
cd myMusic
youtube-dl -e -f 18 --flat-playlist https://youtube.com/playlist?list=PL0o_zxa4K1BX8lFpIiKY97cHfKp7JP2NV 
cd ..
zip -r myMusic.zip myMusic/
