#!/bin/bash

echo "Introduce un directorio"
read directorio

if [ ! -d $directorio ]; then
  echo "Directorio no válido"
  exit

else 

echo -e "NFICH \t NDIR \t NOMBRE"
echo -e "===== \t ==== \t ======"
    
    for i in `ls -l $directorio | grep ^d | sed "s/  */#/g" | cut -f9 -d#`
    do
        subDirectorio=$dirdctorio/$i
        nFich=`ls -l $subDirectorio | grep ^- | wc -l
        nDir=`ls -l $subDirectorio | grep ^d | wc -l
    
        echo -e "$nFich \t $nDir \t $i"
    done
fi 
    
    
 