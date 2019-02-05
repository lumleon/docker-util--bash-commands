#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

function wipe_local_volumes() {
    echo -E "Wiping local volumes ..."

    local VAR_ARE_THERE_ANY_VOLUMES="false"
    local VAR_HOST_PATH_TO_VOLUMES=${1}

    if [ -d ${VAR_HOST_PATH_TO_VOLUMES} ];
    then
        for VAR_NAME_OF_VOLUME in $( ls --almost-all ${VAR_HOST_PATH_TO_VOLUMES}/volumes/ )
        do
            local VAR_PATH_TO_VOLUME=${VAR_HOST_PATH_TO_VOLUMES}/volumes/${VAR_NAME_OF_VOLUME}/
            if [ ! -d ${VAR_PATH_TO_VOLUME} ];
            then
                continue
            fi

            echo -E " * wiping '${VAR_NAME_OF_VOLUME}' ..."

            rm --recursive           \
               --force               \
               ${VAR_PATH_TO_VOLUME}

            echo -e " * wiping '${VAR_NAME_OF_VOLUME}' ... $( __done )"

            VAR_ARE_THERE_ANY_VOLUMES="true"
        done
    fi

    if [ ${VAR_ARE_THERE_ANY_VOLUMES} = "false" ];
    then
        echo -e "Wiping local volumes ... $( __skipped )"
    else
        echo -e "Wiping local volumes ... $( __done )"
    fi
}

wipe_local_volumes ${@}
