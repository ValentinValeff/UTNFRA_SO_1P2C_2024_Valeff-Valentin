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
