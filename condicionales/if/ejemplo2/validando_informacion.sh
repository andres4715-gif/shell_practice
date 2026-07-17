#!/usr/bin/env bash

echo "==== Haciendo validacion de OS ===="

OS="WINDOWS"

if [[ "${OS}" = "WINDOWS" ]]; then 
    echo "El OS es WINDOWS"
    jq -n \
    '{ dato1: 0, dato2: 0, dato3: 2, dato4: 3, dato5: false }' \
    > ./my_json.json
    else 
        echo "El os es Linux"
fi