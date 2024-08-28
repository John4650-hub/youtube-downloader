import subprocess
import json
ID = ""
with open("url.txt", "r") as urlHandle:
    url = urlHandle.read()
ID = url.split("/")[-1].strip()

output = subprocess.run(
    [
        "curl",
        "--request",
        "GET",
        "--url",
        f"https://yt-api.p.rapidapi.com/dl?id={ID}",
        "--header",
        "x-rapidapi-host: yt-api.p.rapidapi.com",
        "--header",
        "x-rapidapi-key: 63614c327bmshff5710d19a2561fp1c98e2jsn5eb02bc425ad",
    ],
    check=True,
    text=True,
    capture_output=True
)

info = json.loads(output.stdout)
Vidname=info["title"]
if info['formats']['itag']=="18":
    vidurl=info['formats']['url']
    with open("url.txt",'w') as fh:
        fh.write(vidurl)
with open("info.txt","w") as fhand:
    fhand.write(vidname)


