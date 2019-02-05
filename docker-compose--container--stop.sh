#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

echo -E "Stopping containers ..."

docker-compose --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               stop

echo -e "Stopping containers ... $( __done )"
