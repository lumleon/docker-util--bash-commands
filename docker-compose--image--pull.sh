#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

echo -E "Pulling docker images ..."

docker-compose --compatibility --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               pull

echo -e "Pulling docker images ... $( __done )"
