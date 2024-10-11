#!/bin/bash

echo
echo "Creando los grupos y usuarios."
echo

LISTA=$1
HASH_VAGRANT=$(sudo grep vagrant /etc/shadow |awk -F ':' '{print $2}')


ANT_IFS=$IFS
IFS=$'\n'

for LINEA in `cat $LISTA`
do
        USUARIO=$(echo  $LINEA |awk -F ':' '{print $1}')
        GRUPO=$(echo  $LINEA |awk -F ':' '{print $2}')

        if grep -i $GRUPO /etc/group > /dev/null; then
                echo "EL grupo "$GRUPO" ya existe, por lo que no va a ser creado de nuevo..."
                echo
        else
                sudo groupadd $GRUPO
                grep -i $GRUPO /etc/group
        fi

        if id $USUARIO > /dev/null; then
                echo "El usuario "$USUARIO" ya existe, por lo que no va ser creado denuevo"
                echo
        else
                sudo useradd -m -s /bin/bash -p "$HASH_VAGRANT" -G $GRUPO $USUARIO
                id $USUARIO
        fi
done
IFS=$ANT_IFS


echo "Cambiando permisos y propietarios"

for i in {1..3}
do
	sudo chown -R p1c2_2024_A$i:p1c2_2024_A$i /Examenes-UTN/alumno_$i
done

sudo chown -R p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores

sudo chmod -R 775 /Examenes-UTN/profesores
sudo chmod -R 750 /Examenes-UTN/alumno_1
sudo chmod -R 760 /Examenes-UTN/alumno_2
sudo chmod -R 700 /Examenes-UTN/alumno_3 

for i in {1..3}
do
	sudo su -c "whoami > /Examenes-UTN/alumno$i/validar.txt"  p1c2_2024_A$i
	echo
	echo "Permisos: "
	sudo ls -l /Examenes-UTN/alumno$i
	echo
	echo "Usuario: "
	sudo cat /Examenes-UTN/alumno$i/validar.txt
done

sudo su -c "whoami > /Examenes-UTN/profesores/validar.txt"  p1c2_2024_P1
echo
echo "Permisos: "
sudo ls -l /Examenes-UTN/profesores
echo
echo "Usuario: "
sudo cat /Examenes-UTN/profesores/validar.txt

