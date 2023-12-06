#!/bin/bash

# Función para calcular la sucesión alícuota de un término
function sucesion_alicuota {
    local k=$1
    local contador=1

    while [ $k -ne 1 ] && [ $contador -le 10 ]; do
        echo -n "$k "
        k=$(divisores_propios $k)
        ((contador++))
    done

    if [ $contador -gt 10 ]; then
        echo -e "\nSucesión alícuota infinita detectada."
    else
        echo ""
    fi
}

# Función para obtener la suma de los divisores propios de un número
function divisores_propios {
    local num=$1
    local suma=0

    for (( i=1; i<=$num/2; i++ )); do
        if [ $((num % i)) -eq 0 ]; then
            ((suma += i))
        fi
    done

    echo "$suma"
}

# Lectura del término k desde teclado
read -p "El término k es: " k

# Verifica que k sea mayor que 0
if [ $k -le 0 ]; then
    echo "El término k debe ser mayor que 0."
    exit 1
fi

# Muestra la sucesión alícuota en la misma línea
echo -n "La sucesión alícuota es: "
sucesion_alicuota $k
