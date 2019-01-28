# script alumnos.ps1

# Para cada entrada del fichero c:\alumnos.txt llamar
# al script c:\bat_alumnos.ps1  

Import-Csv "alumnos.txt" | foreach-object {
.\bat_alumnos.ps1 $_.nombre $_.cuenta $_.asignatura
}