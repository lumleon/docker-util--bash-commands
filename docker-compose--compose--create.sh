#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

echo -E "Creating containers and networks ..."

docker-compose --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               up --no-start

echo -e "Creating containers and networks ... $( __done )"
