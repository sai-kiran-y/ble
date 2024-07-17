#!/bin/bash

FILE_ID="1sajFZSpNM3RqD4ywahIPp2VUeqzZNo-D"
FILE_NAME="peripheral"

# Get the confirmation token and save the cookies
CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://drive.google.com/uc?export=download&id=${FILE_ID}" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p')

# Download the file using the confirmation token and cookies
wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc?export=download&confirm=${CONFIRM}&id=${FILE_ID}" -O ${FILE_NAME}

# Clean up the cookies file
rm /tmp/cookies.txt

