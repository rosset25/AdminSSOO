#!/bin/bash
uid=700
IFS=$'\n'



for linea in $(cat $1)
do

    nombre=$( echo "$linea" | cut -d":" -f1 ) #obtener el nombre del usuario)
    grupo=$( echo "$linea" | cut -d":" -f3 ) #obtener el nombre del grupo
    gid=$( cat /etc/group | grep ^$grupo | cut -d":" -f3 ) #obtener el nombre del gid del grupo (3º campo del fichero)
    
    echo "$nombre:x:$uid:$gid:usuario $nombre:/home/$nombre:/bin/bash" >> /etc/passwd 
    
    echo "$nombre::::::::" >> /etc/shadow 
    
    let uid=uid+1  #incrementar el uid

    mkdir /home/$nombre #crear directorio de trabajo
    chmod 0700 /home/$nombre #cambiar permisos del directorio de trabajo 
    cp -r /etc/skel/.[a-zA-Z]* /home/$nombre #copiar contenido de /etc/skel en directorio de trabajo
    chown -R $nombre:$grupo /home/$nombre
    
    contrasenya=$( echo "$linea" | cut -f2 -d":" )
 
    echo -e "$contrasenya\n$contrasenya" | passwd $nombre

done
