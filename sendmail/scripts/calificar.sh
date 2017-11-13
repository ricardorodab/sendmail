#!/bin/bash


echo -n "Escriba nombre de actividad a calificar tal como se encuentra en el archivo calificaciones.cfg: "
read actividad
echo ""
echo -n "Escriba el mensaje que desea que tengan los repositorios (commit message):"
read commit
echo ""
echo -n "Escriba el asunto que desea que tengan los correos electronicos:"
read asunto
echo ""
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
	location="$(pwd)/.sendmail"
	cd $D
	#Sacamos la calificacion.
	calificacion="$(python $location/scripts/get_calificacion.py ./calificaciones.cfg "$actividad")"
	observaciones="$(python $location/scripts/get_observaciones.py ./calificaciones.cfg "$actividad")"
	#Modificamos el archivo de las Calificaciones.
	cd "$(cat repo_name.cfg)"
	touch Calificaciones.txt
	echo "*************************************************" >> Calificaciones.txt
	echo "Tu calificación para la actividad $actividad es de:">> Calificaciones.txt
	echo "Calificación: $calificacion" >> Calificaciones.txt
	echo "*************************************************" >> Calificaciones.txt
	echo "" >> Calificaciones.txt
	#Hacemos un commit y un push.
	git add .
	git commit -m "$commit"
	git push origin master
	#Enviamos el correo:
	cd $base
	cd $D
	cp "$location/mails/email.txt" ./	
	python "$location/scripts/generar_email.py" ./datos.cfg ./email.txt "$asunto" "$actividad" "$observaciones" "$calificacion"
	correo="$(cat ./correo.txt)"
	echo $correo
	echo "$actividad - $correo - $(date)" >> "$location/salida.log"
	sendmail $correo < ./email.txt
	#Eliminamos todo lo creado.
	rm ./correo.txt
	rm ./email.txt
	cd $base
	unset base
	unset observaciones
	unset location
	unset correo
	unset calificacion
    fi
done

unset actividad
unset commit
unset asunto
