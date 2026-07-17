#!/usr/bin/env bash

function utilizar_bash_c_con_strings() {
    echo $(pwd)
    bash -c "cd $(pwd)/new_folder && pwd"
#                                    ^^^^ este pwd imprime la ruta cuando ingresa a new_folder
    return $? # Este return no es necesario ya que bash retorna el exit code de la ultima linea ejecutada osea que es redundate (No mandatorio)
}

# Utilizar la funcion
utilizar_bash_c_con_strings
exit_code=$?

echo "El exit code es: $exit_code"

# El output seria:
# /Users/ariosmon/Documents/github_personal/shell_practice/condicionales/if/new_folder
# El exit code es: 0