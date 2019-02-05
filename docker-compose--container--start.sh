#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

echo -E "Starting containers ..."

docker-compose --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               start

echo -e "Starting containers ... $( __done )"
