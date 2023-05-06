mkdir myMusic/
pip install git+https://github.com/ytdl-org/youtube-dl.git@master#egg=youtube_dl
cd myMusic
youtube-dl -f 18 --playlist-items 20-30 https://youtube.com/playlist?list=PLK3Jf2YakZU98E_ia8q2n2-XXpf8vH98W
cd ..
zip -r myMusic.zip myMusic/
