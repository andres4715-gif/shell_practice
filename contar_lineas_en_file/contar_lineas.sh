#!/usr/bin/env bash

# Modo estricto para producción
set -euo pipefail

# Variables descriptivas
readonly VALOR_OBJETIVO=1

valor=1
function contar_lineas() {
    local archivo="data.txt"

    if [[ ! -f "${archivo}" ]]; then
        echo "Error: El archivo '${archivo}' no existe." >&2
        return 1
    fi

    # Condicional con sintaxis Bash correcta
    if [[ "${VALOR_OBJETIVO}" -eq $valor ]]; then
        # Usamos < para evitar que wc imprima el nombre del archivo, solo el número
        total_lineas=$(wc -l < "${archivo}")

        # Ahora puedes usar la variable más adelante
            echo "El archivo tiene un total de ${total_lineas} líneas."
    fi
}

main() {
    # Llamada correcta a la función (sin paréntesis)
    contar_lineas
    
    # Capturamos el código de salida de la función
    local estado=$?
    echo "Código de salida de la función: ${estado}"
}

main "$@"