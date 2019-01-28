# script profesores.ps1  

# Crear directorio de alumnos y darle permisos compartidos
# Crear directorio de asignaturas y darle permisos compartidos

# Para cada entrada del fichero c:\asignaturas.txt llamar
# al script c:\bat_profesores.ps1 

New-SmbShare -Name "alumnos" -Path "C:\alumnos" -FullAccess 
New-SmbShare -Name "asignaturas" -Path "C:\asignaturas" -FullAccess 

Import-Csv "asignaturas.txt" | foreach-object {
.\bat_profesores.ps1 $_.asignatura $_.nombre $_.cuenta
}