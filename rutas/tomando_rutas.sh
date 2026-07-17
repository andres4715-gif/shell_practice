#!/usr/bin/env bash

BASE_PATH=/etc/kubernetes
: "${WINDOWS_IMAGE_URL:=https://tools.ocean.af/goe2e/windows/2016/windows2016}"

WINDOWS_PATH=${BASE_PATH}/$(basename $WINDOWS_IMAGE_URL)
echo "La ruta final es: $WINDOWS_PATH"

# El output debe ser
# ➜  rutas ./tomando_rutas.sh
# La ruta final es: /etc/kubernetes/windows2016