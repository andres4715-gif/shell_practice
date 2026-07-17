#!/usr/bin/env bash
set -euo pipefail # stop and exit on error

# 1. EVALUAR TEXTO: ¿El usuario escribió algo al ejecutar el script?
# Usamos -z para verificar si el parámetro $1 está VACÍO (Zero length).
if [[ -z "${1:-}" ]]; then
  echo "❌ Error: No enviaste ningún parámetro."
  echo "👉 Uso: $0 <ruta_a_imagen>"
  exit 1
fi

# Guardamos ese texto en una variable con nombre semántico (no "CADENA")
IMAGE_FILE="$1"

# 2. EVALUAR DISCO: ¿Ese texto corresponde a un archivo real?
# Usamos -f para verificar si el archivo existe físicamente en el servidor.
if [[ ! -f "$IMAGE_FILE" ]]; then
  echo "❌ Error: El archivo físico '$IMAGE_FILE' no existe en el disco."
  exit 1
fi

echo "✅ Listo para subir la imagen: $IMAGE_FILE"
# rsync -avz "$IMAGE_FILE" user@server:/destino/