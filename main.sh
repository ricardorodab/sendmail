#!/bin/bash

if [ "$1" == "pull" ]
then
    echo "Se hará pull a todos los repositorios"
    echo -n "¿Desea continuar? [Y/N]: "
    read respuesta
    if [ "$respuesta" == "Y" ] || [ "$respuesta" == "y" ] || [ "$respuesta" == "yes" ]
    then
	./.sendmail/scripts/hacer_pull.sh
	echo "Operacion lista: Repositorios actualizados"
    fi
elif [ "$1" == "califica" ]
then
    echo "Se realizarán las siguientes operaciones: "
    echo "1. Hacer push."
    echo "2. Enviar correos con la calificación a cada alumno."
    echo -n "¿Desea continuar? [Y/N]: "
    read respuesta
    if [ "$respuesta" == "Y" ] || [ "$respuesta" == "y" ] || [ "$respuesta" == "yes" ]
    then
	./.sendmail/scripts/calificar.sh
	echo "Operacion lista: Tarea calificada."
    fi
elif [ "$1" == "config" ]
then
    echo "Se crearán por cada alumno los archivos de configuracion de manera dinámica."
    echo -n "¿Desea continuar? [Y/N]: "
    read respuesta
    if [ "$respuesta" == "Y" ] || [ "$respuesta" == "y" ] || [ "$respuesta" == "yes" ]
    then
	./.sendmail/scripts/crea_archivos_cfg.sh
	echo "Operacion lista: Los archivos de configuracion están listos para usarse."
    fi
else
    echo "Para usar automatizador deberá ingresar como parámetro una acción:"
    echo "1. ./main.sh config - Configura por primera vez las carpetas."
    echo "2. ./main.sh pull - Actualiza los repositorios."
    echo "3. ./main.sh califica - Envia correos y realiza push a los repositorios."
fi
