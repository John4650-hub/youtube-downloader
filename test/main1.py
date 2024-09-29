import subprocess
import json

ID = ""
url = "https://iv.ggtyler.dev/watch?v=1ex_bNIFR1A"
url = "https://inv.nadeko.net/watch?v=tz8WM50zjmY"
ID = url.split("=")[-1].strip()
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
    capture_output=True,
)

info = json.loads(output.stdout)
with open("foo.json", "w") as fhw:
    json.dump(info, fhw, indent=2)
Vidname = info["title"]
if info["adaptiveFormats"][0]["itag"] == 137:
    vidurl = info["adaptiveFormats"][0]["url"]
    with open("url.txt", "w") as fh:
        fh.write(vidurl)
with open("info.txt", "w") as fhand:
    fhand.write(Vidname)
