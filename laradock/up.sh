#!/usr/bin/env bash
. .env
eval "docker-compose up -d $LARADOCK_SERVICES"
