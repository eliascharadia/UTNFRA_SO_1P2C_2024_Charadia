

USUARIO_RANDOM=$1
GRUPO=$(groups $USUARIO_RANDOM |awk -F ':' '{print $2}' | awk '{print $2}')


sudo useradd -m -s /bin/bash -d /P_Defensa/UDef_Charadia -g $GRUPO UDef_Charadia 

id UDef_Charadia

