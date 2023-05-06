mkdir myMusic/
pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl
cd myMusic
youtube-dl -F https://youtube.com/playlist?list=PL8JRTKSSfvuq_RvV4gIovCS0seiFynaQI
cd ..
zip -r myMusic.zip myMusic/
