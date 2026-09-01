#!/usr/bin/env bash

echo "======================================"
echo     "TEST: Different scenarios"
echo "======================================"
echo ""

echo "======================================"
# Scenario 1: Empty variables vs not defined variables
echo "--- Scenario 1: Empty vs not defined ---"
echo "======================================"

empty_var=""
# var_not_defined does not exists

: ${empty_var:="Default value 1"}
: ${var_not_defined:="Default value 2"}

echo "empty_var = '$empty_var'"
echo "var_not_defined = '$var_not_defined'"
echo ""

echo "======================================"
# SCENARIO 2: Assigned operators by default.
echo "--- SCENARIO 2: Different Operators ---"
echo "======================================"

# ${var:=value}  - assign a value if this is not defined
: ${TEST1:="default1"}
echo "TEST1 is: $TEST1"

# ${var:-value}  - use this value without assign it
echo "TEST2 (using :-) = ${TEST2:-default2}"
echo "TEST2 defined? $([ -z "$TEST2" ] && echo "NO" || echo "YES")"

# ${var:+value}  - it use the value only if this is already defined
TEST3="something"
echo "TEST3 (con :+) = ${TEST3:+TEST3 with value}"

# ${var:?mensaje} - Fails if it is not defined
# : ${REQUIRED_VAR:?ERROR: REQUIRED_VAR es obligatorio}
echo ""

echo "======================================"
# SCENARIO 3: Function that return 0/1 based it found a value
echo "--- SCENARIO 3: FUNCTION WITH RETURN ---"
echo "======================================"

check_value() {
    local var_name=$1
    echo "VALUE INSIDE THE FUNCTION_1: $var_name"
    echo "VALUE INSIDE THE FUNCTION_2:" ${!var_name}
    local var_value=${!var_name}  # Obtener el valor de la variable por nombre
    local default=$2

    # Asignar por defecto si está vacío
    if [ -z "$var_value" ]; then
        eval "$var_name=\"$default\""
        echo "No encontrado '$var_name', asignando: $default"
        return 0  # Retorna 0 = no encontrado
    else
        echo "Encontrado '$var_name': $var_value"
        return 1  # Retorna 1 = encontrado
    fi
}

# Probar función
EXISTING_VAR="tengo valor"
check_value "EXISTING_VAR" "default_existing"
echo "Return code: $?"
echo ""

check_value "MISSING_VAR" "default_missing"
echo "Return code: $?"
echo "MISSING_VAR después de la función: $MISSING_VAR"
echo ""

echo "======================================"
# ESCENARIO 4: Script que toma parámetros y usa defectos
echo "--- ESCENARIO 4: PARÁMETROS CON DEFECTOS ---"
echo "======================================"

USERNAME=${1:-"admin"}
PASSWORD=${2:-"password123"}
HOSTNAME=${3:-"localhost"}
PORT=${4:-"8080"}

echo "Usuario: $USERNAME"
echo "Contraseña: $PASSWORD"
echo "Host: $HOSTNAME"
echo "Puerto: $PORT"
echo ""

echo "======================================"
# ESCENARIO 5: Validación completa
echo "--- ESCENARIO 5: VALIDACIÓN COMPLETA ---"
echo "======================================"

validate_and_print() {
    local var_name=$1
    local var_value=$2
    local default_value=$3

    # Si no hay valor, usar defecto
    if [ -z "$var_value" ]; then
        var_value="$default_value"
        echo "[$var_name] ❌ No encontrado, usando defecto: $var_value"
        return 0
    else
        echo "[$var_name] ✓ Encontrado: $var_value"
        return 1
    fi
}

# Probar
export CONFIG_FILE="/etc/app.conf"
validate_and_print "CONFIG_FILE" "$CONFIG_FILE" "/etc/default.conf"
echo "Return code: $?"
echo ""

validate_and_print "LOG_LEVEL" "$LOG_LEVEL" "INFO"
echo "Return code: $?"
echo ""

echo "======================================"
echo "Tests completed 👷🏻‍♂️"
echo "======================================"
