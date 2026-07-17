#!/usr/bin/env bash

source $(dirname $BASH_SOURCE)/practica1.sh

echo "El nombre del segundo archivo es: ${nombre}"

if [ -d "../daily_practice" ]; then 
        echo "existe como carpeta"
    exit 0
    else 
        echo "no es una carpeta"
    exit 1
fi