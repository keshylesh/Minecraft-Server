#!/bin/sh

# Copy startup files to /data directory if files don't exist there
out=$(ls /data)
length=${#out}
if [ "$length" == "0" ]; then
    cd "/"
    cp /setup/data/* /data
fi

# Change user permissions to allow read-write access
chown -R mcserver /data
chgrp -R mcserver /data
chmod -R u+w /data

/bin/sh /data/start.sh
