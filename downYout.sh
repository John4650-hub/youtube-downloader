USER=john4650-hub \
REPO=youtube-downloader \
GITHUB_API="https://api.github.com/repos/${USER}/${REPO}/releases/latest"
token="$(cat ../.secrets/git_token)"
echo $token
LATEST_URL=$(curl -L \
  -H 'Accept: application/json' \
  -H "Authorization: Bearer $token"\
  $GITHUB_API | jq -r ".assets[] | .url" | sed 's/\"//g')
echo $LATEST_URL
echo "Downloading ..." 

curl -LC - \
  -H 'Accept: application/octet-stream'\
  -H "Authorization: Bearer $token"\
 "${LATEST_URL}?access_token=${token}" -o /data/data/com.termux/files/home/storage/media-1/vid.zip
