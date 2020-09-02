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
if [ -d /var/www/html/tmp ] && [ -d /var/www/html/tmp/pids ] && [ -f /var/www/html/tmp/pids/server.pid ]; then
  echo "Old process id found, removing..."
  rm /var/www/html/tmp/pids/* || exit 1
  echo "Done"
fi

# Delete vendors directory content
if [ -e /var/www/html/vendor ] || [ -L /var/www/html/vendor ]; then
  if [ "$(ls -1q /var/www/html/vendor | wc -l)" != "0" ]; then
    echo "Deleting \"./vendor\" directory contents..."
    rm -Rf /var/www/html/vendor/*
    echo "Done"
  fi
fi
echo "Installing cached gem vendors..."
#gem install bundle || exit 1
#gem install libv8 || exit 1
#bundle install --jobs=4 $(if [ "$IS_PROD" == "1" ]; then echo "--without development test"; fi) || exit 1
if [ -d /opt/deploy/dependencies_config/vendor ]; then
  cp -Rf /opt/deploy/dependencies_config/vendor /var/www/html/vendor || exit 1
  echo "Done"
else
  echo "No cached gem vendors found"
fi

# Delete node modules directory
if [ -e /var/www/html/node_modules ] || [ -L /var/www/html/node_modules ]; then
  echo "Deleting \"./node_modules\" directory..."
  rm -Rf /var/www/html/node_modules
  echo "Done"
fi
echo "Installing cached node modules..."
if [ -d /opt/deploy/dependencies_config/node_modules ]; then
  cp -R /opt/deploy/dependencies_config/node_modules /var/www/html/node_modules || exit 1
  echo "Done"
else
  echo "No cached node modules found"
fi

cd /var/www/html

echo "Execute database migration"
rails db:migrate || $(if [ "$ENV" == 'dev' ]; then echo "exit 1"; else echo 'echo "DEV mode detected, ignoring migration failure..."'; fi)

# Execute test when
if [ "$EXEC_TEST" == '1' ]; then
  echo "Executing tests"
  rails test || exit 1
fi
if [ "$ENV" == "prod" ]; then
  echo "Precompiling assets"
  rake assets:precompile || exit 1
fi
rails s || exit 1
