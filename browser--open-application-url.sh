#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

open_application_url_if_defined
