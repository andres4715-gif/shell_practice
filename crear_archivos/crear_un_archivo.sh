#!/usr/bin/env bash

echo ======= Crear un archivo =========

DATA_VARIABLES="mis_variables.sh"
NOMBRE="Andres"
APELLIDO="Rios"
EDAD=90

cd crear_archivos

cat <<EOF > "${DATA_VARIABLES}"
export NOMBRE="${NOMBRE}"
export APELLIDO="${APELLIDO}"
export EDAD="${EDAD}"
EOF

echo ======= Imprimir los datos =========
echo ${NOMBRE}
echo ${APELLIDO}
echo ${EDAD}

