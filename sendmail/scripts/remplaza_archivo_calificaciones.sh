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
	base="$(pwd)"
	cd $D
	rm ./calificaciones.cfg
	cp "$base/.sendmail/mails/calificaciones.cfg" ./
	cd $base
    fi
done
