import tkinter as tk
from tkinter import *
from pytube import YouTube
from tkinter import messagebox, filedialog
from tkinter.ttk import Progressbar
import time
from PIL import Image, ImageTk
 
# Defining CreateWidgets() function
# to create necessary tkinter widgets

def Widgets():
     
    load = Image.open("YouTube.jpg")
    render = ImageTk.PhotoImage(load)
    img = Label(root, 
					    image=render, 
					    bg = 'palegreen')
    img.image = render
    img.grid(row=1, 
    					column=1,
    					padx=1,
					    pady=10)    
    l = Label(root,text= ' ', bg = 'palegreen')
    l.grid(row=1, column = 4000)
        
    head_label = Label(root, text='''   YouTube Video Downloader Using Tkinter''',
                       padx=15,
                       pady=15,
                       font="verdana 14",
                       bg = 'palegreen',
                       fg="blue")

    head_label.grid(row=2,
                    column=0,
                    pady=10,
                    padx=5,
                    columnspan=3)
 

    link_label = Label(root,
                       text="YouTube link :",
                       bg="salmon",
                       pady=5,
                       padx=5,
                       fg = 'white')

    link_label.grid(row=3,
                    column=0,
                    pady=5,
                    padx=5)

    root.linkText = Entry(root,
                          width=30,
                          textvariable=video_Link,
                          font="Arial 14")

    root.linkText.grid(row=3,
                       column=1,
                       pady=5,
                       padx=5,
                       columnspan=2)
								    
    destination_label = Label(root,
                              text="Destination :",
                              bg="salmon",
                              pady=5,
                              padx=9,
                              fg = 'white')
                              
    destination_label.grid(row=4,
                           column=0,
                           pady=5,
                           padx=5)

    root.destinationText = Entry(root,
                                 width=27,
                                 textvariable=download_Path,                                 font="Arial 14")

    root.destinationText.grid(row=4,
                              column=1,
                              pady=5,
                              padx=5)


    browse_B = Button(root,
                      text="Browse storage",
                      command=Browse,
                      width=10,
                      bg="bisque",
                      relief=GROOVE)

    browse_B.grid(row=5,
                  column=1,
                  pady=1,
                  padx=1)

    Download_B = Button(root,
                        text="Download Video",
                        command=Download,
                        width=20,
                        bg="thistle1",
                        pady=10,
                        padx=15,
                        relief=GROOVE,
                        font="Georgia, 13")

    Download_B.grid(row=6,
                    column=1,
                    pady=20,
                    padx=20)

#adding aprogress bar to show the video download progress	
    vidsize = Button(root,
    	  			text = '''Clickhere 
to see video size
 first''',
    					command = vsize,
    					pady=20,
    					padx=1,
    					font = 'Arial 10',
    					bg="thistle1",
    					fg='red',
    					relief= GROOVE)
    
    vidsize.grid(row=7,column=1)
    
    vidsizelabel = Label(root,
							     textvariable = vsize,
							     width = 20,
							     pady=20,
							     padx=1,
							     fg='red',
							     relief= GROOVE)
    
    vidsizelabel.grid(row = 8, 
								    column= 1,
								    
								    pady=0,
								    padx=1
								    )
    About_app  = Label(root,
										text = '''This app is for downloading youtube videos,
it is built with pytube library.
>>You can check the <<
video size first before downloading.
>>keep an eye on my << 
github repository for future updates
>>Remeber to fill in<<
 the link and storage before doing anything else''',
										font = 'Arial 10',
										bg = 'pale green',
										fg = 'blue')
	
    About_app.grid(row=9,
									column = 1,
									pady = 10)											
    
					
def vsize():
    #Youtube_link = video_Link.get()
#    video = YouTube(Youtube_link)
#    video_size = video.get_highest_resolution().filesize
    m = 'h'
    size = m
    (size)
    
# Defining Browse() to select a
# destination folder to save the video

def Browse():

    # Presenting user with a pop-up for
    # directory selection. initialdir
    # argument is optional Retrieving the
    # user-input destination directory and
    # storing it in downloadDirectory

    download_Directory = filedialog.askdirectory(
        initialdir="YOUR DIRECTORY PATH", title="Save Video")
 
    # Displaying the directory in the directory
    # textbox

    download_Path.set(download_Directory)
 
# Defining Download() to download the video
 
def Download():
    # getting user-input Youtube Link

    Youtube_link = video_Link.get()
 
    # select the optimal location for
    # saving file's

    download_Folder = download_Path.get()
    # Creating object of YouTube()

    getVideo = YouTube(Youtube_link)
 
	# Getting all the available streams of the
    # youtube video and selecting the first
    # from the

    videoStream = getVideo.streams.first()
 
    # Downloading the video to destination
    # directory

    videoStream.download(download_Folder)
 
    # Displaying the message

    messagebox.showinfo("SUCCESSFULLY""DOWNLOADED AND SAVED IN\n" + download_Folder)
 
 # progress func

    #print
						
 	
# Creating object of tk class

root = tk.Tk()
 
# Setting the title, background color
# and size of the tkinter window and
# disabling the resizing property

root.resizable(False, False)
root.title("YouTube Video Downloader")
root.config(background="palegreen")
 
# Creating the tkinter Variables

video_Link = StringVar()
download_Path = StringVar()
d = StringVar()
size = StringVar()
 
# Calling the Widgets() function
Widgets()
 
# Defining infinite loop to run
# application
root.mainloop()
#shortest video = https://youtu.be/7-qGKqveZaM
