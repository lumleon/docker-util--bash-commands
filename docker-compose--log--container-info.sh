#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

echo -E "Printing container info ..."

docker-compose --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               ps

echo -e "Printing container info ... $( __done )"
