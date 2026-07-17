#!/usr/bin/env bash

# Script para practicar copiar archivos en bash

# 1. COPIAR UN ARCHIVO SIMPLE
echo "=== Ejemplo 1: Copiar archivo simple ==="
cp /Users/ariosmon/Documents/github_personal/shell_practice/copiar_archivos/example.sh /Users/ariosmon/Documents/github_personal/shell_practice/copiar_archivos/coping_file/example_backup.sh
echo "Archivo copiado a coping_file/"

# 2. COPIAR CON SOBRESCRITURA CONFIRMADA
echo ""
echo "=== Ejemplo 2: Copiar con confirmación (-i) ==="
# cp -i source destination   # Pregunta si el archivo existe

# 3. COPIAR ARCHIVOS MÚLTIPLES
echo ""
echo "=== Ejemplo 3: Copiar múltiples archivos ==="
# cp file1.sh file2.sh file3.sh /directorio_destino/

# 4. COPIAR RECURSIVAMENTE (carpetas)
echo ""
echo "=== Ejemplo 4: Copiar carpeta completa (-r) ==="
# cp -r /source/folder /destination/folder

# 5. COPIAR CON PRESERVACIÓN DE PERMISOS (-p)
echo ""
echo "=== Ejemplo 5: Copiar preservando permisos ==="
# cp -p source destination

# 6. COPIAR VERBOSE (muestra qué está haciendo)
echo ""
echo "=== Ejemplo 6: Copiar con modo verbose (-v) ==="
# cp -v source destination

# 7. COPIAR COMBINADO: recursivo, verbose, preservar permisos
echo ""
echo "=== Ejemplo 7: Copiar carpeta (recursivo + verbose + permisos) ==="
# cp -rpv /source/folder /destination/folder

# 8. FUNCIÓN PARA COPIAR ARCHIVOS CON VALIDACIÓN
copy_file() {
    local origen=$1
    local destino=$2

    if [[ ! -f "$origen" ]]; then
        echo "Error: El archivo $origen no existe"
        return 1
    fi

    cp "$origen" "$destino"
    echo "Archivo copiado exitosamente: $origen -> $destino"
}

# 9. FUNCIÓN PARA COPIAR MÚLTIPLES ARCHIVOS CON PATRÓN
copy_multiple() {
    local patron=$1
    local destino=$2

    for archivo in $patron; do
        if [[ -f "$archivo" ]]; then
            cp "$archivo" "$destino"
            echo "Copiado: $archivo"
        fi
    done
}

# 10. COPIAR SOLO SI NO EXISTE (no sobrescribir)
echo ""
echo "=== Ejemplo 10: Copiar solo si no existe ==="
if [[ ! -f /Users/ariosmon/Documents/github_personal/shell_practice/copiar_archivos/coping_file/nuevo.sh ]]; then
    cp /Users/ariosmon/Documents/github_personal/shell_practice/copiar_archivos/example.sh /Users/ariosmon/Documents/github_personal/shell_practice/copiar_archivos/coping_file/nuevo.sh
    echo "Archivo nuevo.sh creado"
else
    echo "El archivo nuevo.sh ya existe"
fi

echo ""
echo "Ejemplos completados"