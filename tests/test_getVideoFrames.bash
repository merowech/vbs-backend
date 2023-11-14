#!/bin/bash

server="http://localhost/api"
if [ -f .env ]; then
  set -o allexport
  source .env
  set +o allexport
fi
echo "$server"
query='{"item_id": "00001_6", "k": 5, "add_features": "1"}'

curl -X POST -H "Content-Type: application/json" -d "$query" $server"/getVideoFrames/"
