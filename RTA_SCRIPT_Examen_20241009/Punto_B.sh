#!/bin/bash

DISCO=$(sudo fdisk -l | grep "10 GiB" | awk '{print $2}' | awk -F ':' '{print $1}')

echo "Haciendo la particion extendida en disco: $DISCO"
echo

sudo fdisk $DISCO << Extendida
n
e
1


p
w
Extendida

echo "Haciendo 10 particiones logicas en la particion extendida de: $DISCO"
echo

for i in {1..10}
do
sudo fdisk $DISCO << particiones
n

+100M
w
particiones
done


echo "Particiones: "
sudo fdisk -l $DISCO
echo

echo "Formateando las particiones logicas: "
echo

for i in {5..14}
do
       sudo mkfs.ext4 ${DISCO}$i
done

echo "Montando las particiones logicas:"
echo


echo "${DISCO}5 /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a
echo "${DISCO}6 /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a
echo "${DISCO}7 /Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a
echo "${DISCO}8 /Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a
echo "${DISCO}9 /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a
echo "${DISCO}10 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a
echo "${DISCO}11 /Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a
echo "${DISCO}12 /Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a
echo "${DISCO}13 /Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a
echo "${DISCO}14 /Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab
sudo mount -a

echo
echo "Valido montaje: "
df -h |grep -i examenes
