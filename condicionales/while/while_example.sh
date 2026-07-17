#!/usr/bin/env bash

numero=1

function doingWhile() {
    while (( $numero <= 12 )); do 
        echo $numero
            if (($numero %2 == 0)); then
                echo "El numero es par: $numero" 
            fi
        ((numero++))
    done
}

doingWhile