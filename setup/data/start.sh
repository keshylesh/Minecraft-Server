#!/bin/sh

# Run server as local user to preserve permissions
su - mcserver << EOF

cd "$(dirname "$0")"
if ! [[ -f "server.properties" ]]; then
    # Run server to generate files
    java -jar server.jar nogui

    # Change EULA, seed, and difficulty according to compose.yaml env variables 
    sed -i "s|eula=false|eula=$EULA|" eula.txt

    if ! [[ -z "${SEED}" ]]; then
        sed -i "s|level-seed=|level-seed=$SEED|" server.properties
    fi

    if [[ "${DIFFICULTY}" == "hard" || "${DIFFICULTY}" == "normal" || "${DIFFICULTY}" == "easy" || "${DIFFICULTY}" == "peaceful" ]]; then
        sed -i "s|difficulty=easy|difficulty=$DIFFICULTY|" server.properties
    fi
fi

# Run server
java -Xms1024M -Xmx2048M -jar server.jar nogui

EOF
