#!/bin/bash

export IS_PROD="1" || exit 1
export RAILS_ENV="production" || exit 1

# Detect prod env
if [ "$ENV" == 'dev' ]; then
  export RAILS_ENV="development" || exit 1
  export IS_PROD="0" || exit 1
fi

# Get secrets
export DB_USER="$(cat "$DB_USER_FILE")" || exit 1
export DB_PASS="$(cat "$DB_PASS_FILE")" || exit 1
export SECRET_KEY_BASE="$(cat "$APP_SECRET_KEY_FILE")" || exit 1

$*
