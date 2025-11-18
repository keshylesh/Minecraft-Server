#!/bin/sh

cd "$(dirname "$0")"
exec java -Xms1024M -Xmx2048M -jar server.jar nogui
