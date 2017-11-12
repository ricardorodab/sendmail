#!/bin/bash

for D in `find . -type d -maxdepth 1`
do
    if [ "$D" == "./.sendmail" ] || [ "$D" == "." ]
    then
	echo -n "Se intenta acceder a: "
	echo $D
	echo " Se continua la ejecucion..."
	continue
    else
	echo -n "Pulleando repositorio de "
	echo $D
	base="$(pwd)"
	cd $D
	cd "$(cat repo_name.cfg)"
	git pull origin master
	cd $base
	unset base
    fi
done
