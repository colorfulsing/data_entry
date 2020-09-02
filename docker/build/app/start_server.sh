#!/bin/bash
SCRIPT_FILE=$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"
cd "$SCRIPT_DIR"

# Load scripts
source /opt/deploy/bin/template_tools.sh

# Apply database configuration template
echo ""
echo "Apply templates"
echo ""
TEMPLATE_VARIABLE_LIST='${DB_DATABASE_NAME} ${DB_WRITE_USER} ${DB_WRITE_PASS} ${SECRET_KEY_BASE}'
apply_templates /var/www/html/config/database.yml.template /var/www/html/config || exit 1

# Remove existing server process ID
if [ -d ./tmp ] && [ -d ./tmp/pids ] && [ -f ./tmp/pids/server.pid ]; then
  rm ./tmp/pids/* || exit 1
fi

# Install gems
cd /var/www/html
gem install bundle || exit 1
gem install libv8 || exit 1
bundle install --jobs=4 $(if [ "$IS_PROD" == "1" ]; then echo "--without development test"; fi) || exit 1

# Execute any database migration
rails db:migrate || $(if [ "$ENV" == 'dev' ]; then echo "exit 1"; else echo 'echo "DEV mode detected, ignoring migration failure..."'; fi)

# Execute test when
if [ "$EXEC_TEST" == '1' ]; then
  rails test || exit 1
fi
if [ "$ENV" == "prod" ]; then
  rake assets:precompile || exit 1
fi
rails s || exit 1
