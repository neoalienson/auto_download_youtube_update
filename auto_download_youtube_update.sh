#!/bin/sh

# options for youtube-dl, e.g., --proxy
OPTS='--max-downloads 10'
YOUTUBE_DL=/usr/local/bin/youtube-dl

declare -A URLS

# Sample watch list.
# Folders are created with key name
URLS[cnet_update]=https://www.youtube.com/channel/SWYI9iD9kH0x0
URLS[cnet_news]=https://www.youtube.com/channel/SWaHzZo6fkq8Y
URLS[cracking_open]=https://www.youtube.com/channel/SW4YaZBeFDgzA

for KEY in ${!URLS[@]};
do
  echo $KEY
  mkdir -p $KEY
  cd $KEY
  $YOUTUBE_DL $OPTS ${URLS[$KEY]}
  cd ..
done
