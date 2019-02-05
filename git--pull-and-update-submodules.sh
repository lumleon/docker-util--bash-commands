#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

echo -E "Pulling changes ..."

git pull --rebase

echo -e "Pulling changes ... $( __done )"

echo -E "Updating submodules ..."

git submodule update --init      \
                     --recursive \
                     --remote

git submodule update --recursive

echo -e "Updating submodules ... $( __done )"
