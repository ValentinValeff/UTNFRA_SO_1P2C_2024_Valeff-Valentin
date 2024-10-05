#!/bin/bash


echo "PUNTO A(ESTRUCTURAS REPETITIVAS)"

sudo mkdir -p /Examenes-UTN/alumno_{1..3}/{parcial_1,parcial_2,parcial_3} /Examenes-UTN/profesores

echo
echo "Muestro estructura"
sudo tree /Examenes-UTN |column
