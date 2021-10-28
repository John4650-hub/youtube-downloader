import pytube
from pytube import YouTube,Playlist


print("Read the readme at github")

def video_quality(video_object):
	video_qualities = video_object.streams.filter(progressive= True)
	for v in video_qualities:
		m = str(v).split(' ')
		y = m[1]
		sizev = v.filesize * (9.5367431640625*10**-7)
		vs = round(sizev,2)
		print(f'  {y} ==> size: {(vs)}mb')


running = True
while running:
	url = (input('\n\t url: '))
	m = input('\n\ttype playlist if it is or leave blank: ')
	
	
	if url == 'done' and m == '':
		running = False
		
	if url != 'done':
		if m == '':
			yt = YouTube(url)
			vt = yt.title
			print(f'Video title: {vt}')
			print('\n\tAvailable video qualities')
			video_quality(yt)
				
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
			
			print(f'Video saved in {stm.download()}\nDone.\n\n')
		
	# playlist
		if m == 'pl':
			p = Playlist(url)
			interactive = input("""\n\tEnter 'i' to prompt interactive mode or 
	'n' for none-interactive-mode: """)
			
			if interactive == 'i':
			    for v in p.videos:
    				print('\n',v.title)
    				video_quality(v)
    				choice = input('choose prefered itag or just type skip to skip to next: ')
    
    				if choice == 'skip':
    				    continue
    				else:
    					stm = v.streams.get_by_itag(int(choice))
    					print(f'Video saved in {stm.download()}\nDone.\n')
    					
			else:
			    for v in p.videos:
			        print(f'downloading: {v.title}')
			        print(v.streams.first().download(),' /done')		    
				
else:
	print('\nDone \nThank you for using my program.\nHope you got you wanted ...')
	
