print("Type in 'done' without quotes to humbly end this program. ")
import pytube
from pytube import YouTube, Stream
from pytube.cli import on_progress

running = True
while running:
	url = str(input('url: '))
	if url == 'done':
		running = False
	else:
		yt = YouTube(url, on_progress_callback = on_progress)
		vt = yt.title
		print(f'Video title: {vt}')
		print('\tAvailable qualities')
		qualities = yt.streams.filter(progressive= True)
		
		for v in qualities:
			m = str(v).split(' ')
			y = m[1]
			sizev = v.filesize * (9.5367431640625*10**-7)
			vs = round(sizev,2)
			print(f'  {y} ==> size: {(vs)}mb')
		
		choice = int(input('choose prefered itag: '))
		stm = yt.streams.get_by_itag(choice)
		print(stm.download())
else:
	print('Done \n Thank you for using me.')
