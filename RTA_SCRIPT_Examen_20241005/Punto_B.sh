#!/bin/bash

DISCO =$(sudo fdisk -l |grep "10 GiB" | awk '{print $2}' | awk -F ':' '{print $1}')
sudo fdisk $DISCO <<EOF

n
p
1
+1G

n
p
2
+1G

n
p
3
+1G

n
e
4
+7G

n
#opcion por defecto
#opcion por defecto
+1G

n
#opcion por defecto
#opcion por defecto
+1G

n
#opcion por defecto
#opcion por defecto
+1G

n
#opcion por defecto
#opcion por defecto
+1G

n
#opcion por defecto
#opcion por defecto
+1G

n
#opcion por defecto
#opcion por defecto
+1G

n
#opcion por defecto
#opcion por defecto
+1G

wq
EOF
echo

echo "Muestro como quedo:"
sudo fdisk -l $DISCO
