mkdir myMusic/
pip install youtube-dl
ls
youtube-dl -F https://youtube.com/playlist?list=PL8JRTKSSfvuq_RvV4gIovCS0seiFynaQI

mv -f *.mp4 myMusic/
zip -r myMusic.zip myMusic/
