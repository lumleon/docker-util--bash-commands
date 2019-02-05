#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

echo -E "Building docker images ..."

docker-compose --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               build

echo -e "Building docker images ... $( __done )"
