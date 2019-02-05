#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

function wipe_stale_containers() {
    local VAR_ARE_THERE_STALE_CONTAINERS="false"

    echo -E "Removing stale containers ..."

    for VAR_ID_OF_CONTAINER in $( docker ps --all --quiet --filter status=exited --filter status=dead )
    do
        echo -E " * removing container '${VAR_ID_OF_CONTAINER}' ..."

        docker rm ${VAR_ID_OF_CONTAINER}

        echo -e " * removing container '${VAR_ID_OF_CONTAINER}' ... $( __done )"

        VAR_ARE_THERE_STALE_CONTAINERS="true"
    done

    if [ "${VAR_ARE_THERE_STALE_CONTAINERS}" = "false" ];
    then
        echo -e "Removing stale containers ... $( __skipped )"
    else
        echo -e "Removing stale containers ... $( __done )"
    fi
}

function wipe_stale_images() {
    local VAR_ARE_THERE_STALE_IMAGES="false"

    echo -E "Removing stale images ..."

    for VAR_ID_OF_IMAGE in $( docker images --quiet --filter dangling=true )
    do
        echo -E " * removing image '${VAR_ID_OF_IMAGE}' ..."

        docker rmi ${VAR_ID_OF_IMAGE}

        echo -e " * removing image '${VAR_ID_OF_IMAGE}' ... $( __done )"

        VAR_ARE_THERE_STALE_IMAGES="true"
    done

    if [ "${VAR_ARE_THERE_STALE_IMAGES}" = "false" ];
    then
        echo -e "Removing stale images ... $( __skipped )"
    else
        echo -e "Removing stale images ... $( __done )"
    fi
}

function wipe_stale_networks() {
    echo -E "Removing networks ..."
    docker network prune --force
    echo -e "Removing networks ... $( __done )"
}

wipe_stale_containers
wipe_stale_images
wipe_stale_networks
