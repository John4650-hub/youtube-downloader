def video_quality(video_object):
	video_qualities = video_object.streams.filter(progressive= True)
	for v in video_qualities:
		m = str(v).split(' ')
		y = m[1]
		sizev = v.filesize * (9.5367431640625*10**-7)
		vs = round(sizev,2)
		print(f'  {y} ⇒ size: {(vs)}mb')

def audio_quality(audioQualityObject):
	for aud in audioQualityObject:
						m = str(aud).split(' ')
						y = m[1]
						sizev = aud.filesize * (9.5367431640625*10**-7)
						vs = round(sizev,2)
						
						print(f'  {y} ⇒ size: {(vs)}mb')

def totalsize(pl):
	total_size = []
	for v in pl:
		filt= v.streams.get_by_itag('18')
		sizev = filt.filesize * (9.5367431640625*10**-7)
		vs = round(sizev,2)
		total_size.append(vs)
	return str(sum(total_size))+'mbs'
