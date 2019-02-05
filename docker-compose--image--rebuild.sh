#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

echo -E "Rebuilding docker images ..."

docker-compose --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               build  --no-cache

echo -e "Rebuilding docker images ... $( __done )"
