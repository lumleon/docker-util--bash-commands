#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

echo -E "Creating and starting containers and networks ..."

docker-compose --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               up --detach

echo -e "Creating and starting containers and networks ... $( __done )"
