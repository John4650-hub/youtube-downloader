import base64
import json
import subprocess
import os
def getTk():
    return os.getenv("GITHUB_TOKEN")


def add_padding(txt):
    # Calculate the required padding length
    padding_needed = 4 - (len(txt) % 4)
    if padding_needed:
        txt += "=" * padding_needed
    return txt


def get_sha():
    shash_ = subprocess.run(
        [
            "curl",
            "-L",
            "-H",
            "Accept: application/vnd.github+json",
            "-H",
            f"Authorization: Bearer {getTk()}",
            "-H",
            "X-GitHub-Api-Version: 2022-11-28",
            "https://api.github.com/repos/John4650-hub/Pastebin/contents/timebin",
        ],
        capture_output=True,
        text=True,
        check=True,
    )
    return json.loads(shash_.stdout)["sha"]


def get_data_dict():
    shash_ = subprocess.run(
        [
            "curl",
            "-L",
            "-H",
            "Accept: application/vnd.github+json",
            "-H",
            f"Authorization: Bearer {getTk()}",
            "-H",
            "X-GitHub-Api-Version: 2022-11-28",
            "https://api.github.com/repos/John4650-hub/Pastebin/contents/timebin",
        ],
        capture_output=True,
        text=True,
        check=True,
    )
    print(json.loads(shash_.stdout))
    return json.loads(shash_.stdout)["content"]


with open("foo.json", "w") as da:
    da.write(str(
        base64.b64decode(bytes(get_data_dict(), "utf-8"), validate=False).decode(
            "utf-8"
        )
    ).strip())
