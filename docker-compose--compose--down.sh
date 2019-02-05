#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

echo -E "Stopping and removing containers and networks ..."

docker-compose --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               down

echo -e "Stopping and removing containers and networks ... $( __done )"
