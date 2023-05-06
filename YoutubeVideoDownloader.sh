mkdir myMusic/
pip install youtube-dl
ls
youtube-dl -f mp4 https://youtube.com/playlist?list=PL8JRTKSSfvuq_RvV4gIovCS0seiFynaQI

mv -f *.mp4 myMusic/
zip -r myMusic.zip myMusic/
