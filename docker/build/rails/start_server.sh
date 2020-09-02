#!/bin/bash

# Remove existing server process ID
if [ -d ./tmp ] && [ -d ./tmp/pids ] && [ -f ./tmp/pids/server.pid ]; then
  rm ./tmp/pids/* || exit 1
fi

# Prepare database configuration
cp ./config/database.yml.template ./config/database.yml || exit 1

gem install bundle || exit 1
bundle install --jobs=4 $(if [ "$IS_PROD" == "1" ]; then echo "--without development test"; fi) || exit 1
rails db:migrate || exit 1

# Execute test when
if [ "$IS_PROD" == "1" ] && [ "$EXEC_TEST" == '1' ]; then
  rails test || exit 1
fi
if [ "$IS_PROD" == "1" ]; then
  rake assets:precompile || exit 1
fi
rails s || exit 1
