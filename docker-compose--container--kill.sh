#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

echo -E "Killing containers ..."

docker-compose --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               kill

echo -e "Killing containers ... $( __done )"
