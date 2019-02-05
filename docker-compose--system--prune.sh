#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

echo -E "Pruning docker system ..."

docker system prune --all   \
                    --force
                    
echo -e "Pruning docker system ... $( __done )"
