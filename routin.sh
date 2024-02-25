#!/bin/bash
shopt -s expand_aliases
source ~/.bashrc
gitsh
git add .
git commit -m "Download video"
git push

