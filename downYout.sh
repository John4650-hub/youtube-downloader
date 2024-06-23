#!/bin/bash
USER=john4650-hub
REPO=youtube-downloader
TAG="429.0.0"
echo $TAG
GITHUB_API="https://api.github.com/repos/${USER}/${REPO}/releases/tags/${TAG}"
token="$(cat ../.secrets/git_token)"
echo $token
LATEST_URL=$(curl -L \
  -H 'Accept: application/json' \
  -H "Authorization: Bearer $token"\
  $GITHUB_API | jq -r ".assets[] | .browser_download_url" | sed 's/\"//g')
echo $LATEST_URL
echo "Downloading ..." 
cd /storage/3461-6461/Android/media/com.termux/vid
curl -L \
  -H 'Accept: application/octet-stream'\
  -H "Authorization: Bearer $token"\
 "${LATEST_URL}" -o "vid${TAG}.zip"
cd -
