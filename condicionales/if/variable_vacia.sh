#!/usr/bin/env bash

echo "The BAREMETAL IS: $BAREMETAL"
NEW_DATA=$BAREMETAL

if [ -z "$NEW_DATA" ]; then 
    echo "La variable BAREMETAL NO TIENE DATA"
    else echo "La variable BAREMETAL tiene un valor de: $NEW_DATA"
fi