#!/bin/bash

LISTA=$1
USER_HASH=$2

HASH=$(sudo grep -i "$USER_HASH" /etc/shadow | awk -F ':' '{print $2}')

ANT_IFS=$IFS
IFS=$'\n'

for LINEA in $(cat "$LISTA" | grep -v ^#); do
    echo "Linea: $LINEA"
    echo
    
    USUARIO=$(echo "$LINEA" | awk -F ',' '{print $1}')
    GRUPO=$(echo "$LINEA" | awk -F ',' '{print $2}')

    sudo groupadd "$GRUPO"
    sudo useradd -m -p "$HASH" -s /bin/bash -G "$GRUPO" "$USUARIO"
    echo "---------------------------------------"
    echo
done

IFS=$ANT_IFS

sudo chown p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chmod 750 /Examenes-UTN/alumno_1

sudo chown p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chmod 760 /Examenes-UTN/alumno_2

sudo chown p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chmod 700 /Examenes-UTN/alumno_3

sudo chown p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores
sudo chmod 775 /Examenes-UTN/profesores
