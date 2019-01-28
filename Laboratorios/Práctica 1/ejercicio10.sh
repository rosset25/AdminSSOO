#!/bin/bash

echo "¿Qué usuario busco?"
read usuario

if [ ! -d /home/$usuario/tmp ]; then
    echo "No existe el usuario"
    exit
    
else

    echo "Se borran los ficheros del usuario $usuario"

    tamanyoTotalBytes=0
    tamanyoFichero=0
    for i in `ls -l /home/$usuario/tmp/*.aux`
    do
        if [ -f $i ]; then
	echo $i
            tamanyoFichero=`ls -l $i | sed "s/  */#/g" | cut -f5 -d#`
            ((tamanyoTotalBytes=$tamanyoFichero+$tamanyoTotalBytes))
            tamanyoFichero=0
            rm $i
        fi 
    done
fi

echo "Total de bytes eliminados $tamanyoTotalBytes"
