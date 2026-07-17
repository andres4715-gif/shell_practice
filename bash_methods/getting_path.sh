#!/bin/bash

set -euo pipefail # stop and exit on error

echo "GETTING PATHS AND NAME OF THE SCRIPTS" 

echo 💥 Getting path
echo path: $(dirname $BASH_SOURCE)


echo 👀 Getting the path and name of the script
echo source: $(dirname $BASH_SOURCE)/$(basename $BASH_SOURCE)