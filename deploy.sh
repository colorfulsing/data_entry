#!/bin/bash
# Autor: Eduardo Rosales (https://github.com/tato11)

#======================================
# Get and set config variables
#======================================
# Constants
HELP_MESSAGE="Use -h or --help for help."

# Config
SCRIPT_FILE=$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"
cd "$SCRIPT_DIR"

# Variables
PROC_ID_LIST=
PROC_ID_SEED=0

# Flags
IS_FIRST_PARAM=1
YES_TO_ALL=0
START=0
BUILD=0
DOWN=0
STOP=0

# Display a confirmation message
function confirm () {
  # Call with a prompt string or use a default
  local answer="Y"
  local response=""
  if [ $YES_TO_ALL -eq 1 ]; then
    echo "${1:-Are you sure? (y/n)} Y"
    local response="Y"
  else
    read -r -p "${1:-Are you sure? (y/n)} " local response
  fi
  if [ "$response" != "" ]; then
    local answer="$response"
  fi
  case $answer in
    [yY][eE][sS]|[yY])
      true
      ;;
    *)
      false
      ;;
  esac
}

# Show help message
function show_help() {
cat <<EOF

Description:
  This script will start or rebuild all containers described on docker compose
  file.

Usage:
EOF
  echo "  ./$1 <action> [options]"
cat <<EOF

Help:
  -h, --help               print this message

Actions:
  start                    Start the existing containers.
  rebuild                  Build or rebuild the containers.
  destroy                  Delete the containers.

Options:
  -y, --yes                respond yes to all questions

EOF
  exit 0
}

# Show help message when no parameters
if [ $# -lt 1 ]; then
  show_help $SCRIPT_FILE
fi
while test $# -gt 0; do
  # Get action
  if [ "$IS_FIRST_PARAM" == "1" ] && [ "$1" != "-h" ] &&  [ "$1" != "--help" ]; then
    ACTION="$1"
    IS_FIRST_PARAM=0
    shift
    continue
  fi

  # Get options
  case "$1" in
    -h|--help)
      show_help $SCRIPT_FILE
      ;;
    -y|--yes)
      YES_TO_ALL=1
      shift
      ;;
    *)
      echo "Error: Invalid parameter '$1' found. $HELP_MESSAGE"
      exit 1
      ;;
  esac
done

# Validate action
case "$ACTION" in
  start)
    START=1
    DOWN=0
    BUILD=0
    STOP=1
    ;;
  rebuild)
    START=1
    DOWN=1
    BUILD=1
    STOP=1
    ;;
  destroy)
    START=0
    DOWN=1
    BUILD=0
    STOP=1
    ;;
  *)
    echo "Error: Invalid action \"$ACTION\". $HELP_MESSAGE"
    exit 1
    ;;
esac

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#Keep sudo alive
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
cat <<EOF

IMPORTANT
=========
You are about to $ACTION this docker compose and will need root access to do so.

EOF
echo ""
! confirm "  Do you want to continue? (y/n) [y]" && exit 0
echo ""

# Ask for root access only once
sudo -v
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

function sudo_env() {
  sudo env PWD="$PWD" $*
}

function store_background_job() {
  PROC_ID_LIST[${PROC_ID_SEED}]=$1 || exit 1
  PROC_ID_SEED=$(($PROC_ID_SEED + 1)) || exit 1
}

function wait_background_jobs() {
  local PROC_ID=
  for PROC_ID in ${PROC_ID_LIST[*]}; do
    wait $PROC_ID
  done

  # Reset process list
  PROC_ID_LIST=
  PROC_ID_SEED=0
}

# Cancel background process
function cancel_background_jobs() {
  for PROC_ID in ${PROC_ID_LIST[*]}; do
    sudo kill -SIGINT $PROC_ID
  done
}

function stop_app() {
  echo "Stopping project's containers..."
  sudo_env docker-compose stop || exit 1
  echo "Done"
}

function stop_app_when_need() {
  if [ "$STOP" == "1" ]; then
    stop_app || exit 1
  fi
}

# Stop docker containers if started
stop_app_when_need || exit 1

# Safety cancel on ctrl + c
function catch_ctrl_c() {
  STOP=1
  stop_app
  wait_background_jobs
}

# trap ctrl-c and call ctrl_c()
trap 'catch_ctrl_c' SIGINT


if [ "$DOWN" == "1" ]; then
  echo "Destroying project's existing containers..."
  sudo_env docker-compose down || exit 1
  echo "Done."
fi

if [ "$BUILD" == "1" ]; then
  echo "Building project's containers..."
  sudo_env docker-compose build || exit 1
  sudo_env docker-compose up --no-start || exit 1
  echo "Done."
fi

if [ "$START" == "1" ]; then
  echo "Starting project's containers..."
  sudo_env docker-compose start || exit 1
  sudo_env docker-compose logs -f &
  store_background_job $!
  wait_background_jobs
  echo "Done."
fi

catch_ctrl_c
