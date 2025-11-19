#!/bin/sh

cd "$(dirname "$0")"

if ! [[ -f "server.properties" ]]; then
    java -Xms1024M -Xmx2048M -jar server.jar nogui
    sed -i "s|eula=false|eula=$EULA|" eula.txt

    if ! [[ -z "${SEED}" ]]; then
        sed -i "s|level-seed=|level-seed=$SEED|" server.properties
    fi

    if [[ "${DIFFICULTY}" == "hard" || "${DIFFICULTY}" == "normal" || "${DIFFICULTY}" == "easy" || "${DIFFICULTY}" == "peaceful" ]]; then
        sed -i "s|difficulty=easy|difficulty=$DIFFICULTY|" server.properties
    fi
fi

exec java -Xms1024M -Xmx2048M -jar server.jar nogui
