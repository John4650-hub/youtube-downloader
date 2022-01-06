try:
	import pytube
	from pytube import YouTube,Playlist
except:
	print('''⚠ ️Check if you have the pytube installed
		⚠ Check if it's the latest version''')
else:
	from utils import *
	
	print("Read the readme at github",end='')
	#https://youtu.be/tPEE9ZwTmy0
	running = True
	while running:
		print('\nYou are home 🏠')
		try:
			url = (input('\nPaste url here: '))
			m = input('\nEnter pl for playlist 📋 or leave blank: ')
		
		
			if url == 'done' and m == '':
				running = False
				
			if url != 'done':
				if m == '':
					yt = YouTube(url)
					vt = yt.title
					print(f'Video title: {vt}')
					print('\nAvailable video qualities')
					video_quality(yt)
						
					audio_qualities = yt.streams.filter(only_audio = True)
					print('\nAvailable audio qualities')
					audio_quality(audio_qualities)
					choice = int(input('choose prefered itag: '))
					stm = yt.streams.get_by_itag(choice)
					
					print(f'Video saved in {stm.download()}\nDone.\n\n')
				
			# playlist
				if m == 'pl':
					p = Playlist(url)
					interactive = input("\nEnter 'i' to prompt interactive mode or 'n' for none-interactive-mode: ")
					count = len(p.videos)
					print(f'This playlist contains {count} videos')
					print('wait, calculating total size of this playlist')
					#print(f'Playlist total size: {totalsize(p.videos)}')		
					if interactive == 'i':
					    for v in p.videos:
		    				print(f'\nTitle: {v.title}')
		    				print(f'Choose Video Quality')
		    				video_quality(v)
		    				choice = input('choose prefered itag or just type skip to skip to next: ')
		    
		    				if choice == 'done':
		    				    print('You are done with playlists, redirecting you back to home.')
		    				    break
		    				    
		    				if choice == 'skip':
		    				    print('skipping Video')
		    				    continue
		    				else:
		    					stm = v.streams.get_by_itag(int(choice))
		    					print('Download in progress...')
		    					print(f'Video saved in {stm.download()}\nDone.\n')
		    					
					else:
					    for v in p.videos:
					        print(f'downloading: {v.title}')
					        print(v.streams.first().download(),'done')		    
		except:
			print('''
⚠ please check if you entered the correct link,
⚠ Also check if you have internet connection on.''')

	else:
		print('\nDone \nThank you for using my program.\nHope you got you wanted ...')
		