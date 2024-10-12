#!/bin/bash

echo "Creando estructura asimetrica: "
echo

mkdir -p $HOME/Estructura_Asimetrica/{{cliente,correo}/cartas_{1..100},correo/carteros_{1..10}}

echo "Verificacion: "
echo

cd $HOME
tree Estructura_Asimetrica/ --noreport | pr -T -s' ' -w 80 --column 4

