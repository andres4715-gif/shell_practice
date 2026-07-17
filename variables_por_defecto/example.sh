#!/usr/bin/env bash
set -euo pipefail # stop and exit on error

# Variables por defecto
# si tengo el valor de la variable toma el valor asignado pero si no, toma el valor por defecto 
# La prueba se hizo con la variable: IMAGE_SERVER_URL

IMAGE_SERVER_URL=http://1234567890.dkr.ecr.us-west-2.amazonaws.com

# Inicialización de variables globales al inicio del script
: "${IMAGE_SERVER_URL:=http://go898.xxxxx.gg/ccccc}"
: "${KUBECONFIG:=/root/.kube/config}"
: "${ENVIRONMENT:=production}"

# A partir de aquí, puedes usar las variables tranquilamente
# sabiendo que 100% tienen un valor.
echo "Descargando de: $IMAGE_SERVER_URL"