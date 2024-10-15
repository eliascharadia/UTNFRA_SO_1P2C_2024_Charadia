

echo "Memoria swap"

sudo mkswap /dev/sdd1
sudo swapon /dev/sdd1


echo "Formateo-Montaje"

sudo mkfs.ext4 /dev/sdd2
sudo mount /dev/sdd2 /P_Defensa

