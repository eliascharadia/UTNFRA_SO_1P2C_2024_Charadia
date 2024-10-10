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

	sudo groupadd $GRUPO
	sudo useradd -m -s /bin/bash -p "HASH_VAGRANT" -G $GRUPO $USUARIO
	id $USUARIO
done
IFS=$ANT_IFS
