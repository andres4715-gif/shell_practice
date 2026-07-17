#!/usr/bin/env bash

set -euo pipefail # stop and exit on error

# Nota
# Funciona en macOS, pero NO en Linux
# sed -i '' 's|dario|dario2|g' "data.txt"

# Funciona en Linux, pero NO en macOS
# sed -i 's|dario|dario2|g' "data.txt"


sed -i '' 's|dario2|dario3|g' "data.txt" # <-- Este solo funciona en Mac