#!/usr/bin/env bash

# Import setup from another file
source $(dirname $BASH_SOURCE)/config.sh

echo "======================================"
echo "    DEMO: Value by default in Bash"
echo "======================================"
echo ""

# Example 1: The value comes from -> config.sh
echo "--- Example 1: BINARY_SERVER_SSH ---"
echo "👷🏻‍♂️ BINARY_SERVER_SSH: " ${BINARY_SERVER_SSH} 
: ${BINARY_SERVER_SSH:=default_user@default.server}

if [ -n "$BINARY_SERVER_SSH" ]; then # -n means "not empty"
    echo "✅ Found value: $BINARY_SERVER_SSH"
    exit_code=0
else
    echo "❌ value not found, using default value"
    exit_code=1
fi
echo "Exit code: $exit_code"
echo ""

# Example 2: Variable with NO with no value in config.sh
echo "--- Example 2: USER_NAME (No defined) ---"
: ${USER_NAME:="JOHN DOE"}

if [ -n "$USER_NAME" ]; then # -n means "not empty"
    echo "✅ Found Value: ${USER_NAME}" # sent by another file or value by default
    exit_code=0
else
    echo "❌ value not found, using default value"
    exit_code=1
fi
echo "Exit code: $exit_code"
echo ""

# Example 3: Variable with valid value in config.sh
echo "--- Example 3: DATABASE_URL ---"
: ${DATABASE_URL:=sqlite://local}

if [ -n "$DATABASE_URL" ]; then
    echo "✅ Value found : $DATABASE_URL"
    exit_code=0
else
    echo "❌ Value not found, using value by default"
    exit_code=1
fi
echo "Exit code: $exit_code"
echo ""

# Example 4: Variable without value and empty default value
echo "--- Example 4: OPTIONAL_PARAM (Without value) ---"
: ${OPTIONAL_PARAM:=}

if [ -n "$OPTIONAL_PARAM" ]; then
    echo "✅ Found value: $OPTIONAL_PARAM"
    exit_code=0
else
    echo "❌ Value not found (Empty by default)"
    exit_code=1
fi
echo "Exit code: $exit_code"
echo ""

# Example 5: func to validate values
echo "--- Example 5: Function with validation ---"

validate_config() {
    local var_name=$1
    local var_value=$2
    local default_value=$3

    # value by default if the value does not exit 
    : ${var_value:=$default_value}

    if [ -n "$var_value" ]; then
        echo "✓ $var_name = $var_value"
        return 0  # success
    else
        echo "✗ $var_name, No value"
        return 1  # Fail
    fi
}

# Run the func using different values 
validate_config "API_KEY" "$API_KEY" "default_api_key"
validate_config "MISSING_VAR" "$MISSING_VAR" "default_missing_value"
echo ""

# Example 6: Using a different file by default
echo "--- Example 6: Read the alternative file ---"

# If CUSTOM_CONFIG is not defined, Try to load from a file
if [ -z "$CUSTOM_CONFIG" ]; then
    if [ -f "./file.txt" ]; then
        source "./file.txt"
    else
        : ${CUSTOM_CONFIG:="config_by_default"}
    fi
fi

echo "CUSTOM_CONFIG = $CUSTOM_CONFIG"
echo ""

echo "======================================"
echo "      Demonstration has ended"
echo "======================================"
