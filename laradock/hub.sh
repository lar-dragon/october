#!/usr/bin/env bash
. .env
docker-compose build workspace
echo "$HUB_TOKEN" | docker login -u "$HUB_USER" --password-stdin
docker-compose push workspace
docker logout
