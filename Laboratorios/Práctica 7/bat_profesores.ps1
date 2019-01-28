# script bat_profesores.ps1

# Crear directorio de la asignatura 
# Crear la cuenta de usuario del profesor 
# Crear el grupo local de esa asignatura
# Añadir el profesor al grupo de la asignatura
# Eliminar la herencia del directorio de la asignatura
# Asignar permisos al directorio de la asignatura


param($asignatura,$nombre,$cuenta)
	mkdir "c:\asignaturas\$asignatura"
	grupo="asig$asignatura"
	New-ADUser -Name $nombre -SamAccountName $cuenta -AccountPassword "Practicas2017"
	New-ADGroup -Name $grupo -GroupScope DomainLocal
	Add-ADGroupMember $grupo $cuenta
	icacls "c:\$asignatura" /inheritance:d
	icacls "c:\$asignatura" /grant ($grupo + ´:RX´) Usuarios:N ($cuenta + ´:F´) Administrador:F 