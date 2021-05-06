

@echo off 
color 0a 
chcp 65001 
for %%f in (*.sql) do ( 
  echo Ejecutando el archivo %%f 
  sqlcmd -S DESARROLLADOR -U TRANSFOR -P SECTOR -d nominamatanza -i %%f 
) 
echo termino 
pause 


