import os
import base64
import json
import requests  # Import the requests library
import subprocess
personal_access_token = os.getenv("GITHUB_TOKEN")


def get_sha(api):
    shash_ = subprocess.run(
        [
            "curl",
            "-L",
            "-H",
            "Accept: application/vnd.github+json",
            "-H",
            f"Authorization: Bearer {api}",
            "-H",
            "X-GitHub-Api-Version: 2022-11-28",
            "https://api.github.com/repos/John4650-hub/Pastebin/contents/timebin",
        ],
        capture_output=True,
        text=True,
        check=True,
    )
    return json.loads(shash_.stdout)["sha"]


def read_json_file(filepath):
    """ Read a JSON file and return its contents as a base64-encoded string """
    with open(filepath, "r") as file:
        content = file.read()  # Read and parse JSON file, then dump it to a string
    return base64.b64encode(content.encode("utf-8")).decode("utf-8")

# Define your file path and sha
file_path = "foo.json"
sha_ = get_sha(personal_access_token)# Placeholder for the actual SHA value

# Encode the content of the JSON file
content_base64 = read_json_file(file_path)

# Prepare data for the GitHub API request
data = {
    "message": "done",
    "content": content_base64,
    "sha": sha_
}

# Prepare headers for the GitHub API request
headers = {
    "Accept": "application/vnd.github+json",
    "Authorization": f'Bearer {personal_access_token}',
    "X-GitHub-Api-Version": "2022-11-28",
}

# Make the PUT request to the GitHub API
response = requests.put(
    "https://api.github.com/repos/John4650-hub/Pastebin/contents/timebin",
    headers=headers,
    json=data,
)

# Print the response for debugging
print(response.status_code)
print(response.json())
