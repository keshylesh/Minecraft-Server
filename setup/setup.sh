#!/bin/sh

chown mcserver /data
out=$(ls /data)
length=${#out}
if [ "$length" == "0" ]; then
    cd "/"
    cp /setup/data/* /data
fi
/bin/sh /data/start.sh
