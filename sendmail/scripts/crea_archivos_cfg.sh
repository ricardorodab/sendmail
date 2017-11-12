#!/bin/bash

for D in `find . -type d -maxdepth 1`
do
    # Revisemos que no entramos en la carpeta actual (de nuevo) y
    # no tocamos la carpeta donde se encuentra el src.
    if [ "$D" == "./.sendmail" ] || [ "$D" == "." ]
    then
	echo -n "Se intenta acceder a: "
	echo -n $D
	echo " Se continua la ejecucion..."
	continue
    else
	echo "Copiando archivo de calificaciones a $D/"
	cp ./.sendmail/mails/calificaciones.cfg "$D/"
	cd $D
	touch datos.cfg
	echo -n "¿Cuál es el nombre completo de "
	echo "$D?"
	read nombre
	echo -n "¿Cuales es el correo de "
	echo "$D?"
	read correoid
	echo "[NOMBRE]" >> datos.cfg
	echo "" >> datos.cfg
	echo "nombre = $nombre" >> datos.cfg
	echo "" >> datos.cfg
	echo "[EMAIL]" >> datos.cfg
	echo "" >> datos.cfg
	echo "correo = $correoid" >> datos.cfg
	echo "" >> datos.cfg
	unset nombre
	unset correo
	cd ..	
    fi
    
done
