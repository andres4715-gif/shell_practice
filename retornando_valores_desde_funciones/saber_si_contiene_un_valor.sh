#!/usr/bin/env bash

# 1) Función que retorna un CÓDIGO DE SALIDA (como tu ejemplo de ssh)

tel=456

function validar_telefono {
    if [[ $tel == *7* ]]; then # $tel == *7* sirve para saber si existe un valor en la variable
        return 0   # éxito
    else
        return 1   # falla
    fi
}

validar_telefono
codigo=$?

echo "Codigo Generado: $codigo"
