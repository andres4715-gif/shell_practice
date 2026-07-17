#!/usr/bin/env bash

# Script de prueba con diferentes escenarios

echo "======================================"
echo "TEST: Diferentes Escenarios"
echo "======================================"
echo ""

# ESCENARIO 1: Variables vacías vs no definidas
echo "--- ESCENARIO 1: Vacío vs No Definido ---"

var_vacia=""
# var_no_definida no existe

: ${var_vacia:="valor por defecto 1"}
: ${var_no_definida:="valor por defecto 2"}

echo "var_vacia = '$var_vacia'"
echo "var_no_definida = '$var_no_definida'"
echo ""

# ESCENARIO 2: Operadores de asignación por defecto
echo "--- ESCENARIO 2: Diferentes Operadores ---"

# ${var:=valor}  - asigna si está vacío o no definido
: ${TEST1:="defecto1"}
echo "TEST1 (con :=) = $TEST1"

# ${var:-valor}  - usa defecto sin asignar
echo "TEST2 (con :-) = ${TEST2:-defecto2}"
echo "TEST2 definida? $([ -z "$TEST2" ] && echo "NO" || echo "SÍ")"

# ${var:+valor}  - usa valor SOLO si está definido
TEST3="algo"
echo "TEST3 (con :+) = ${TEST3:+TEST3 tiene valor}"

# ${var:?mensaje} - falla si no está definido
# : ${REQUIRED_VAR:?ERROR: REQUIRED_VAR es obligatorio}
echo ""

# ESCENARIO 3: Función que retorna 0/1 basado en si encontró valor
echo "--- ESCENARIO 3: FUNCIÓN CON RETURN ---"

check_value() {
    local var_name=$1
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

# ESCENARIO 4: Script que toma parámetros y usa defectos
echo "--- ESCENARIO 4: PARÁMETROS CON DEFECTOS ---"

USERNAME=${1:-"admin"}
PASSWORD=${2:-"password123"}
HOSTNAME=${3:-"localhost"}
PORT=${4:-"8080"}

echo "Usuario: $USERNAME"
echo "Contraseña: $PASSWORD"
echo "Host: $HOSTNAME"
echo "Puerto: $PORT"
echo ""

# ESCENARIO 5: Validación completa
echo "--- ESCENARIO 5: VALIDACIÓN COMPLETA ---"

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
echo "Tests completados"
echo "======================================"
