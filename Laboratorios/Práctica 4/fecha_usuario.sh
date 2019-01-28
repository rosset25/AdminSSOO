#/bin/bash

#Busca si el usuario tiene fecha de desactivacion de su cuenta
#dicha informacion estará guardada en el fichero shadow
#en caso de no encontrar al usuario en dicho fichero, 
#se sacará por pantalla el grupo primario al que pertenece

for i in $(cat /etc/passwd)
do
  usuario_pass=$( echo "$i" | cut -d":" -f1 )
  grupo_ID=$( echo "$i" | cut -d":" -f4 )
  usuario_shadow=$( cat /etc/shadow| grep -e ^$usuario_pass:)
  
  if [ "$usuario_shadow" ]; then
	fecha=$( cat /etc/shadow | grep -e ^$usuario_pass: | cut -d":" -f8 ) 

	if [ "$fecha" = "" ]; then
		echo "No tiene fecha de desactivación de cuenta"  
	else
		echo "$fecha"
	fi  
  else
    	grupo_primario=$( cat /etc/group | grep -e $grupo_ID: | cut -d":" -f1 )
	echo "$grupo_primario" 
   fi
done


