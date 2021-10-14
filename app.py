print("Type in 'done' without quotes to humbly end this program. ")
import pytube
from pytube import YouTube, Stream

running = True
while running:
	url = str(input('url: '))
	if url == 'done':
		running = False
	else:
		yt = YouTube(url)
		vt = yt.title
		print(f'Video title: {vt}')
		print('\n\tAvailable video qualities')
		video_qualities = yt.streams.filter(progressive= True)
		
		for v in video_qualities:
			m = str(v).split(' ')
			y = m[1]
			sizev = v.filesize * (9.5367431640625*10**-7)
			vs = round(sizev,2)
			print(f'  {y} ==> size: {(vs)}mb')
			
		audio_qualities = yt.streams.filter(only_audio = True)
		print('\n\tAvailable audio qualities')
		for aud in audio_qualities:
			m = str(aud).split(' ')
			y = m[1]
			sizev = aud.filesize * (9.5367431640625*10**-7)
			vs = round(sizev,2)
			print(f'  {y} ==> size: {(vs)}mb')
		choice = int(input('choose prefered itag: '))
		stm = yt.streams.get_by_itag(choice)
		print(f'Video saved in {stm.download()}\nDone.\n')
		
else:
	print('\nDone \nThank you for using me ...')
