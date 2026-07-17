#!/usr/bin/env bash

source $(dirname $BASH_SOURCE)/personal_data.sh

echo "En main: $MY_NAME $MY_LASTNAME"

# Llama a hijo.sh como proceso hijo (NO con source)
./hijo.sh