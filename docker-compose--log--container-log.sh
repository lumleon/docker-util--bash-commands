#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

echo -E "Printing container logs ..."

docker-compose --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               logs

echo -e "Printing container logs ... $( __done )"
