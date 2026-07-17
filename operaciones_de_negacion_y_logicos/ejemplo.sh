#!/usr/bin/env bash

echo "Este es el test para operadores de negacion y logicos"

RUTA="/Users/ariosmon/Documents/github_personal/shell_practice/operadores_de_negacion_y_logicos"
echo "--- La ruta actual es: $(pwd)" 
RUTA_ACTUAL=$(pwd)
NUEVA_RUTA="/Users/ariosmon/Desktop/andres/rios/"
EDAD=5

echo "--- La edad es: ${EDAD}"

if [ -z "${EDAD}" ]; then
    echo "--- La variable edad esta vacia"
elif [ "${RUTA}" = "${RUTA_ACTUAL}" ] && [ -e "${NUEVA_RUTA}" ] && [ ! -z "${EDAD}" ]; then
        echo "El archivo si existe"
fi