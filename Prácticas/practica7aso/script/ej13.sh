#!/bin/bash

# Función para invertir una cadena y almacenar el resultado en una variable global
Reverse() {
    local original="$1"
    local longitud=${#original}
    local invertida=""

    for (( i=longitud-1; i>=0; i-- )); do
        invertida="${invertida}${original:i:1}"
    done

    # Almacena el resultado en la variable global
    cadena_invertida=$invertida
}

# Comprueba que se le pasa un parámetro
if [ $# -eq 0 ]; then
    echo "Error: Debes proporcionar una cadena entre comillas para invertir."
    exit 1
fi

# Llama a la función Reverse con el primer argumento
Reverse "$1"

# Imprime la cadena original y la invertida
echo "Cadena original: $1"
echo "Cadena invertida: $cadena_invertida"


