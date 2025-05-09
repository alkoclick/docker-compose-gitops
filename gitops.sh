#!/usr/bin/env sh

if [ ! -d .git ]; then
    echo "Error: Current directory (`pwd`) is not a git repository!"
    exit 2
fi

git config --global --add safe.directory $(pwd)

while true
do
    git fetch
    LOCAL=$(git rev-parse HEAD)
    REMOTE=$(git rev-parse @{u})

    if [ $LOCAL != $REMOTE ]; then
        git pull origin $(git rev-parse --abbrev-ref HEAD)

        docker compose up --remove-orphans --detach
    fi

    sleep 60
done
