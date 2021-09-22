from tkinter import *
from tkinter import filedialog
from tkinter import messagebox
from pytube import YouTube
from PIL import Image, ImageTk



def clickDownload():
    if getURL.get() == "":
        messagebox.showinfo("ERROR", "ENTER url please!")
        return
    elif getLoc.get() == "":
        messagebox.showinfo("ERROR", "ENTER LOCATION ")
        return

    select = listbox.curselection()
    quality = videos[select[0]]
    location = getLoc.get()
    quality.download(location)
    messagebox.showinfo(
        "Downloading Finish", yt.title + " has been downloaded Sucessfully!!!"
    )


def setURL():
    # Get URL of the Video
    url = getURL.get()
    print(url)

    # Create Object to hold the URL
    global yt
    yt = YouTube(url)
    # Get the Quality of the Videos and store in the 'videos' variable
    global videos
    videos = yt.streams.filter(mime_type="video/mp4").all()

    # Get Quality and display as list in the Listbox
    count = 1
    for v in videos:
        listbox.insert(END, str(count) + ". " + str(v) + "\n\n")
        count += 1


def clickBrowse():
    location_of_download = filedialog.askdirectory()
    getLoc.set(location_of_download)


def clickReset():
    getURL.set("")
    getLoc.set("")
    listbox.delete(0, END)


def get_info():
    messagebox.showinfo(
        "Showing Help",
        "This is a simple tkinter app for downloading youtube videos, \nFirstly: you need to enter you url you copied in the first entry, \n\nSecondly: you need to enter your preferred storage location \n\nThirdly: you need to press <set url>\n\nWait for about 30seconds. In the empty list new text will appear\n\nThe new text is the quality of all available streams\n\nChoose whatever you want and lastly click <download>, \n\nwait for a while. when finished a message will pop up.",
    )
    return


def get_error():
    messagebox.showinfo(
        "ERROR", "If any error occurs, check you internet connections and try agiain"
    )

# Create Root Object
root = Tk()

# Set Title
root.title("""YouTube Video Dowloader""")

# Set size of window

# Make the Window not Resizeable

root.resizable(False, False)

# Set Labels
headLabel = Label(
    root,
    text=""" YOUTUBE VIDEO DOWNLOADER""",
    font=("Century Gothic", 16),
    bg="#149928",
    fg="blue",
).grid(row=0, columnspan=2, pady=5)

load = Image.open("YouTube.jpg")
render = ImageTk.PhotoImage(load)
img = Label(root, image=render, bg="#149928")
img.image = render
img.grid(row=1, columnspan=2, padx=1, pady=10)

urlLabel = Label(
    root,
    text="""YouTube
link:""",
    font=("Century Gothic", 15),
    bg="#149928",
    fg="blue",
).grid(row=2, column=0, padx=1, pady=1)
qualityLabel = Label(
    root,
    text="""SELECT
 VIDEO
QUALITY""",
    font=("Century Gothic", 15),
    bg="#149928",
    fg="blue",
).grid(row=7, column=0, padx=0, pady=10)
locLabel = Label(
    root, text="LOCATION", font=("Century Gothic", 15), bg="#149928", fg="blue"
).grid(row=4, column=0, padx=1, pady=10)


# Get Input
getURL = StringVar()
getLoc = StringVar()

# Set Entry
urlEntry = Entry(
    root,
    font=("Century Gothic", 12),
    textvariable=getURL,
    width=35,
    bd=3,
    relief= SOLID,
    borderwidth=1,
).grid(row=2, column=1, padx=10, pady=10)
locEntry = Entry(
    root,
    font=("Century Gothic", 12),
    textvariable=getLoc,
    width=35,
    bd=3,
    relief=SOLID,
    borderwidth=1,
).grid(row=4, column=1, padx=10, pady=10)

# List box for video Quality
listbox = Listbox(
    root,
    font=("Century Gothic", 11),
    width=35,
    height=12,
    bd=3,
    relief=SOLID,
    borderwidth=1,
)
listbox.grid(row=7, column=1, padx=0, pady=0)

# Set Buttons

urlButton = Button(
    root,
    text="SET URL",
    font=("Century Gothic", 10),
    width=15,
    relief=GROOVE,
    borderwidth=4,
    command=setURL,
    bg="#991483",
    fg="yellow",
).grid(row=3, column=1, padx=1, pady=0)

browseButton = Button(
    root,
    text="BROWSE",
    font=("Century Gothic", 10),
    width=15,
    relief=GROOVE,
    borderwidth=4,
    command=clickBrowse,
    bg="#991483",
    fg="yellow",
).grid(row=5, column=1, padx=1, pady=10)

downloadButton = Button(
    root,
    text="DOWNLOAD",
    font=("Century Gothic", 10),
    width=15,
    relief=GROOVE,
    borderwidth=4,
    
    bg="#991483",
    fg="yellow",
    command=clickDownload,
).grid(row=6, column=1, padx=10, pady=10)

resetButton = Button(
    root,
    text="CLEAR ALL",
    font=("Century Gothic", 10),
    width=15,
    relief=GROOVE,
    borderwidth=5,
    command=clickReset,
    bg="#991483",
    fg="yellow",
).grid(row=8, column=1, padx=1, pady=0)
root.config(background="#149928")

infoButton = Button(root,
    text="Help",
    font=("Century Gothic", 10),
    width=5,
    relief=GROOVE,
    borderwidth=5,
    command=get_info,
    bg="#991403",
    fg="yellow",
).grid(row=9, column=0, padx=0, pady=0)

errorButton = Button(root,
    text="Error",
    font=("Century Gothic", 10),
    width=5,
    relief=GROOVE,
    borderwidth=5,
    command=get_error,
    bg="#991403",
    fg="yellow",
).grid(row=10, column=0, padx=0, pady=10)

root.geometry("550x900")
root.resizable(True,True)
# Set an infinite loop so window stays in view
root.mainloop()
# sample video ==> https://youtu.be/7-qGKqveZaM
