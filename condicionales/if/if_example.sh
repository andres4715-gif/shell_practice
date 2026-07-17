#!/bin/bash

set -euo pipefail # stop and exit on error
age = 20
base = 18
if [$age -gt $base];
then
    echo "You are eligible to vote"
else
    echo "You are not eligible to vote"
fi

echo "===Preparing worker"
worker_ssh "$PROVISION_LOCAL_DIR/prepare_worker.sh"