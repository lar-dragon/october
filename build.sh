#!/usr/bin/env bash

# CONFIG
envsubst < template.env | sed '/^[^=]\+=$/d' > .env

# INSTALL
if [[ $APP_ENV =~ "dev" || $APP_ENV =~ "testing" ]]; then
  composer install --prefer-dist --no-interaction --no-suggest
else
  composer install --prefer-dist --no-interaction --no-suggest --no-dev
fi
npm install --no-optional

# MIGRATE
php artisan october:up
php artisan october:util compile assets
php artisan october:passwd admin "$APP_ADMIN_PASS"
