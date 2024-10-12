#!/bin/bash
echo "Ecribo info de la memoria"
echo
grep -i memtotal /proc/meminfo > repogit/UTNFRA_SO_1P2C_2024_Charadia/RTA_ARCHIVOS_Examen_20241009/Filtro_Basico.txt


echo "Agrego info del chassis"
echo
sudo dmidecode -t chassis |grep -Ei "chassis|manufactu" >> repogit/UTNFRA_SO_1P2C_2024_Charadia/RTA_ARCHIVOS_Examen_20241009/Filtro_Basico.txt
