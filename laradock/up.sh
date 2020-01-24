#!/usr/bin/env bash
t=$(mktemp)
export -p > "$t"
. .env
# shellcheck disable=SC1090
. "$t"
rm "$t"
unset t
eval "docker-compose up -d $LARADOCK_SERVICES"
