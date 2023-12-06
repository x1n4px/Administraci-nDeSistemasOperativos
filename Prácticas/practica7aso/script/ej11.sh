#!/bin/bash

# Comprueba que se le pasa al menos un parámetro
if [ $# -lt 1 ]; then
    echo "Error: Debes proporcionar al menos un parámetro."
    return 1
fi

# Obtiene el directorio pasado como argumento
directorio=$1

# Comprueba que se le pasa un directorio como argumento
if [ ! -d "$directorio" ]; then
    echo "Error: El argumento no es un directorio válido."
    return 2
fi

# Comprueba que el directorio no es el directorio actual
if [ "$directorio" == "$PWD" ]; then
    echo "Error: El directorio proporcionado es el directorio actual."
    return 3
fi

# Comprueba que tiene permisos de búsqueda en el directorio
if [ ! -x "$directorio" ]; then
    echo "Error: No tienes permisos de búsqueda en el directorio proporcionado."
    return 3
fi

# Cambia al directorio proporcionado
cd "$directorio"

# Imprime el directorio actual después de cambiar
echo "Directorio actual: $PWD"

