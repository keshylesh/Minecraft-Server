#!/bin/sh

cd "$(dirname "$0")"
java -Xms1024M -Xmx2048M -jar server.jar nogui
echo "eula=$EULA" > eula.txt
if ! [[ -z "${SEED}" ]]; then
    sed -i "s|level-seed=|level-seed=$SEED|" server.properties
    echo "Bruh"
else
    echo "Not set??: ${SEED}"
fi
exec java -Xms1024M -Xmx2048M -jar server.jar nogui
