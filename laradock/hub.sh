#!/usr/bin/env bash
t=$(mktemp)
export -p > "$t"
. .env
# shellcheck disable=SC1090
. "$t"
rm "$t"
unset t
docker-compose build workspace
echo "$HUB_TOKEN" | docker login -u "$HUB_USER" --password-stdin
docker-compose push workspace
docker logout
