#!/usr/bin/env bash
set -euo pipefail # stop and exit on error

# Default variables
# if I have the value of the variable it takes the assigned value, but if not, it takes the default value
# The test was done with the variable: IMAGE_SERVER_URL

IMAGE_SERVER_URL=http://1234567890.dkr.ecr.com

# Initialization of global variables at the start of the script
: "${IMAGE_SERVER_URL:=http://go898.xxxxx.gg/ccccc}"

# From here on, you can safely use the variables
# knowing that they 100% have a value.
echo "Download from: $IMAGE_SERVER_URL"