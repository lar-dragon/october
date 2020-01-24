#!/usr/bin/env bash
export APP_ENV=testing
export CACHE_DRIVER=array
export SESSION_DRIVER=array
vendor/bin/phpunit
npm run-script test
