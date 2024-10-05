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


#Formateamos particiones
sudo mkfs.ext4 /dev/sdc1 #Particion primaria 1 
sudo mkfs.ext4 /dev/sdc2 #Particion primaria 2
sudo mkfs.ext4 /dev/sdc3 #Particion primaria 3

sudo mkfs.ext4 /dev/sdc5 #PARTICION LOGICA 1
sudo mkfs.ext4 /dev/sdc6 #PARTICION LOGICA 2
sudo mkfs.ext4 /dev/sdc7 #PARTICION LOGICA 3
sudo mkfs.ext4 /dev/sdc8 #PARTICION LOGICA 4
sudo mkfs.ext4 /dev/sdc9 #PARTICION LOGICA 5
sudo mkfs.ext4 /dev/sdc10 #PARTICION LOGICA 6
sudo mkfs.ext4 /dev/sdc11 #PARTICION LOGICA 7

echo "monto particiones en forma permanente"

echo "/dev/sdc1 /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "/dev/sdc2 /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "/dev/sdc3 /Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 2" | sudo tee -a /etc/fstab

echo "/dev/sdc5 /Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "/dev/sdc6 /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "/dev/sdc7 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "/dev/sdc8 /Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "/dev/sdc9 /Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "/dev/sdc10 /Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "/dev/sdc11 /Examenes-UTN/profesores ext4 defaults 0 2" | sudo tee -a /etc/fstab

sudo mount -a
