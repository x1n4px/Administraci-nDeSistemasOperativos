#!/bin/bash

# Función para encontrar archivos ejecutables en un directorio
function ZZZ {
    # Configura el separador de campos interno para procesar nombres de archivos con espacios
    IFS=$'\n'
    
    # Obtiene la lista de archivos en el directorio proporcionado y la almacena en la variable ficheros
    ficheros=$(ls -1 $1)
    
    # Itera sobre cada archivo en ficheros
    for fichero in $ficheros; do
        # Construye la ruta completa del archivo
        path_fichero="$1/$fichero"
        
        # Verifica si el archivo es ejecutable
        if [ -x $path_fichero ]; then
            # Imprime la ruta completa del archivo ejecutable
            echo $path_fichero
        fi
    done
    
    # Restaura el separador de campos interno a dos puntos
    IFS=':'
}

# Configura el separador de campos interno para procesar directorios en la variable PATH
IFS=':'

# Itera sobre cada directorio en la variable PATH
for dir in $PATH; do
    # Verifica si el directorio es una cadena vacía
    if [ -z "$dir" ]; then
        echo "ENCONTRADO UN DIRECTORIO VACIO"
        exit 1
    # Verifica si el elemento en PATH no es un directorio válido
    elif ! [ -d "$dir" ]; then
        echo "$dir NO ES UN DIRECTORIO VALIDO"
        exit 1
    else
        # Llama a la función ZZZ con el directorio como argumento
        ZZZ $dir
    fi
done
