#!/usr/bin/env bash


echo "Funciones con parametros"

NOMBRE="Andres1"

function saludar {
    local nombre=$1
    local apellido=$2
    echo "HOLA ${nombre} ${apellido}" # Con la variable local de la funcion
    echo "HOLA ${NOMBRE} ${apellido}" # Con la variable global del file
}


saludar "Andres2" "Rios"