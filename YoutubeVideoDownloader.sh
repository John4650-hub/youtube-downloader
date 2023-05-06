mkdir myMusic/
pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl
cd myMusic
youtube-dl -f 18 https://youtube.com/playlist?list=PLTF9h-T1TcJi_1FdKlH4dbf_3uI4wuT99
cd ..
zip -r myMusic.zip myMusic/
