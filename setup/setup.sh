#!/bin/sh

out=$(ls /data)
length=${#out}
if [ "$length" == "0" ]; then
    cd "/"
    cp /setup/data/* /data
    chmod -r +w /data
fi
/bin/sh /data/start.sh
