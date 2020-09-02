#!/bin/bash

IS_PROD="" || exit 1

# Detect prod env
if [ "$RAILS_ENV" == '' ] || [ "$RAILS_ENV" == "production" ]; then
  IS_PROD="1" || exit 1
  export RAILS_ENV="production" || exit 1
fi
export RAKE_ENV="$RAILS_ENV" || exit 1

# Remove existing server process ID
if [ -d ./tmp ] && [ -d ./tmp/pids ] && [ -f ./tmp/pids/server.pid ]; then
  rm ./tmp/pids/* || exit 1
fi

# Get secrets
export DB_USER="$(cat "$DB_USER_FILE")" || exit 1
export DB_PASS="$(cat "$DB_PASS_FILE")" || exit 1
export SECRET_KEY_BASE="$(cat "$APP_SECRET_KEY_FILE")" || exit 1

# Prepare database configuration
cp ./config/database.yml.template ./config/database.yml || exit 1

gem install bundle || exit 1
bundle install --jobs=4 $(if [ "$IS_PROD" == "1" ]; then echo "--without development test"; fi) || exit 1
rails db:migrate || exit 1
if [ "$RAILS_ENV" == "production" ]; then
  rake assets:precompile || exit 1
fi
rails s || exit 1
