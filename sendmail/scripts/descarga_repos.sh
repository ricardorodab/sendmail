#!/bin/bash

for D in `find . -type d -maxdepth 1`
do
    if [ "$D" == "./.sendmail" ] || [ "$D" == "." ]
    then
	echo -n "Se intenta acceder a: "
	echo -n $D
	echo " Se continua la ejecucion..."
	continue
    else
	echo -n "Repo de: "
	echo $D
	read linkgit
	cd $D
	git clone $linkgit
	touch repo_name.cfg
	for F in `find . -type d -maxdepth 1`
	do
	    echo $F > repo_name.cfg
	done
	cd ..
	unset linkgit
    fi
done
