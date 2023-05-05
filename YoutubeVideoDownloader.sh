mkdir myMusic/
git clone https://github.com/John4650-hub/pytube.git
cd pytube
pip install .
ls
python music.py
mv -f *.mp4 myMusic/
zip -r myMusic.zip myMusic/
