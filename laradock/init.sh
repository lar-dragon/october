#!/usr/bin/env bash
t=$(mktemp)
export -p > "$t"
. .env
# shellcheck disable=SC1090
. "$t"
rm "$t"
unset t
git init
git remote add origin "$LARADOCK_ORIGIN"
git fetch origin --tags --prune
git checkout -b "$COMPOSE_PROJECT_NAME"
git add -A
git commit -m "Add project-level changes"
git pull --rebase -Xtheirs origin "$LARADOCK_BRANCH"
