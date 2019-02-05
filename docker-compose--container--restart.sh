#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

echo -E "Restarting containers ..."

docker-compose --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               restart

echo -e "Restarting containers ... $( __done )"
