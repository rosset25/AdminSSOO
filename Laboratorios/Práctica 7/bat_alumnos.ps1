# Fichero: bat_alumnos.ps1


# Crear la cuenta del alumno
# Añadir el alumno al grupo de la asignatura
# Crear directorio del alumno 

# Eliminar la herencia del directorio del alumno 
# Asignar permisos al directorio del alumno 

param($nombre,$cuenta,$asignatura)
	grupo="asig$asignatura"
	New-ADUser -Name $nombre -SamAccountName $cuenta -AccountPassword "Practicas2017"
	Add-ADGroupMember $grupo $cuenta
	mkdir "c:\alumnos\$cuenta"
	icacls "c:\alumnos\$cuenta" /inheritance:d
	icacls "c:\alumnos\$cuenta" /grant Usuarios:N ($cuenta + ´:F´) Administrador:F 