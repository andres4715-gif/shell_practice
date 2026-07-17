#!/usr/bin/env bash

# 1) Función que retorna un CÓDIGO DE SALIDA (como tu ejemplo de ssh)

tel=4567

function validar_telefono {
    if [[ ${#tel} -ge 3 ]]; then # El ${#tel} sirve para saber la cantidad de caracteres que tiene la variable 
        return 0   # éxito
    else
        return 1   # falla
    fi
}

validar_telefono
codigo=$?

echo "Codigo Generado: $codigo"
