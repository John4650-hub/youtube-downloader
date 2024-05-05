import requests

# Replace 'YOUR-TOKEN', 'OWNER', 'REPO', and 'RELEASE_ID' with your actual values.
with open("../.secrets/git_token",'r') as f:
    token = f.read().strip()
owner = "john4650-hub"
repo = "youtube-downloader"
for i in range(5,4,-1):
    release_id = i
    url = f"https://api.github.com/repos/{owner}/{repo}/releases/tags/1.0"
    headers = {
        "Accept": "application/vnd.github+json",
        "Authorization": f"Bearer {token}",
        "X-GitHub-Api-Version": "2022-11-28",
    }

    response = requests.get(url, headers=headers)
    try:
        release_id= response.json()["id"]
        url = f"https://api.github.com/repos/{owner}/{repo}/releases/{release_id}"

        response = requests.delete(url, headers=headers)

        # Check the response status code
        if response.status_code == 204:
            print("Release deleted successfully.")
        else:
            print("Failed to delete release:", response.status_code, response.text)
    except:
        continue
