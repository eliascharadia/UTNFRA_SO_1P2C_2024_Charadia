#!/bin/bash

IP=$(curl -s ifconfig.me |grep .)
SOY_EL_USUARIO=$(whoami)
HASH_DE_MI_USUARIO=$(sudo cat /etc/shadow |grep $SOY_EL_USUARIO|awk -F ':' '{print $2}')

cd $HOME/repogit/UTNFRA_SO_1P2C_2024_Charadia
URL_REPOSITORIO=$(git remote get-url origin)


echo "Escribo el archivo: "
echo

cat << FIN > $HOME/repogit/UTNFRA_SO_1P2C_2024_Charadia/RTA_ARCHIVOS_Examen_20241009/Filtro_Avanzado.txt
> Mi IP Publica es: $IP
> Mi usuario es: $SOY_EL_USUARIO
> El Hash de mi Usuario es: $HASH_DE_MI_USUARIO
> La URL de mi repositorio es: $URL_REPOSITORIO
FIN




