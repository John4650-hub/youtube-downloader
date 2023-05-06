mkdir myMusic/
pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl
cd myMusic
youtube-dl -f 18 --playlist-items 7-22 https://youtube.com/playlist?list=PL0o_zxa4K1BX8lFpIiKY97cHfKp7JP2NV 
cd ..
zip -r myMusic.zip myMusic/
