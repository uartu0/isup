#!/bin/bash

# Check if URL is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <URL>"
  exit 1
fi

URL=$1

while true; do
  response=$(curl -I -s -o /dev/null -w "%{http_code}" $URL)

  if [ "$response" -eq 200 ] || [ "$response" -eq 301 ]; then
    echo "It's up!"
    break
  else
    echo "Retrying..."
    sleep 1
  fi
done
