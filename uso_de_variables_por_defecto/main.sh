#!/usr/bin/env bash

# Import setup from another file
source $(dirname $BASH_SOURCE)/config.sh

echo "======================================"
echo "DEMO: Value by default in Bash"
echo "======================================"
echo ""

# Example 1: The value comes from -> config.sh
echo "--- Example 1: BINARY_SERVER_SSH ---"
echo "👷🏻‍♂️ BINARY_SERVER_SSH: " ${BINARY_SERVER_SSH} 
: ${BINARY_SERVER_SSH:=default_user@default.server}

if [ -n "$BINARY_SERVER_SSH" ]; then # -n means "not empty"
    echo "✓ Found value: $BINARY_SERVER_SSH"
    exit_code=1
else
    echo "✗ Valor NO encontrado, usando defecto"
    exit_code=0
fi
echo "Exit code: $exit_code"
echo ""

# EJEMPLO 2: Variable que NO tiene valor en config.sh
echo "--- EJEMPLO 2: USER_NAME (NO DEFINIDO) ---"
: ${USER_NAME:=admin@localhost}

if [ -n "$USER_NAME" ]; then # -n means "not empty"
    echo "✓ Valor encontrado: $USER_NAME"
    exit_code=1
else
    echo "✗ Valor NO encontrado, usando defecto"
    exit_code=3
fi
echo "Exit code: $exit_code"
echo ""

# EJEMPLO 3: Variable que SÍ tiene valor en config.sh
echo "--- EJEMPLO 3: DATABASE_URL ---"
: ${DATABASE_URL:=sqlite://local}

if [ -n "$DATABASE_URL" ]; then
    echo "✓ Valor encontrado: $DATABASE_URL"
    exit_code=1
else
    echo "✗ Valor NO encontrado, usando defecto"
    exit_code=0
fi
echo "Exit code: $exit_code"
echo ""

# EJEMPLO 4: Variable sin valor con defecto vacío
echo "--- EJEMPLO 4: OPTIONAL_PARAM (SIN VALOR) ---"
: ${OPTIONAL_PARAM:=}

if [ -n "$OPTIONAL_PARAM" ]; then
    echo "✓ Valor encontrado: $OPTIONAL_PARAM"
    exit_code=1
else
    echo "✗ Valor NO encontrado (defecto vacío)"
    exit_code=0
fi
echo "Exit code: $exit_code"
echo ""

# EJEMPLO 5: FUNCIÓN para validar valores
echo "--- EJEMPLO 5: FUNCIÓN CON VALIDACIÓN ---"

validate_config() {
    local var_name=$1
    local var_value=$2
    local default_value=$3

    # Usar el valor por defecto si no existe
    : ${var_value:=$default_value}

    if [ -n "$var_value" ]; then
        echo "✓ $var_name = $var_value"
        return 1  # Éxito
    else
        echo "✗ $var_name no tiene valor"
        return 0  # Fallo
    fi
}

# Probar función con diferentes variables
validate_config "API_KEY" "$API_KEY" "default_api_key"
validate_config "MISSING_VAR" "$MISSING_VAR" "default_missing_value"
echo ""

# EJEMPLO 6: Usando un archivo separado como defecto
echo "--- EJEMPLO 6: LEER DE ARCHIVO ALTERNATIVO ---"

# Si CUSTOM_CONFIG no está definido, intenta leer de un archivo
if [ -z "$CUSTOM_CONFIG" ]; then
    if [ -f "/etc/app/config" ]; then
        source "/etc/app/config"
    else
        : ${CUSTOM_CONFIG:="config_por_defecto"}
    fi
fi

echo "CUSTOM_CONFIG = $CUSTOM_CONFIG"
echo ""

echo "======================================"
echo "Demo completada"
echo "======================================"
