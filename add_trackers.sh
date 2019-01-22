#!/bin/bash

if [ -z $1 ]; then
    echo "Usage: $0 hash"
    exit -1
fi

HASH=$1
INDEX=`rtxmlrpc -r d.tracker_size $HASH`
URLS=`curl 'https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best.txt'`

for url in $URLS; do
    echo $url
    rtxmlrpc -r d.tracker.insert="$HASH","$INDEX","$url"
    INDEX=$((INDEX + 1))
done
