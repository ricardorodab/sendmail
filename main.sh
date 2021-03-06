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
elif [ "$1" == "califica-no-repo" ]
then
    echo "Se realizarán las siguientes operaciones: "
    echo "1. Enviar correos con la calificación a cada alumno."
    echo -n "¿Desea continuar? [Y/N]: "
    read respuesta
    if [ "$respuesta" == "Y" ] || [ "$respuesta" == "y" ] || [ "$respuesta" == "yes" ]
    then
	./.sendmail/scripts/calificar_sin_repo.sh
	echo "Operacion lista: Correos con calificación enviados."
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
elif [ "$1" == "limpia" ]
then
    echo "Se eliminarán de forma PERMANENTE todos los archivos basura de todas las carpetas hijas a esta."
    echo -n "¿Desea continuar? [Y/N]: "
    read respuesta
    if [ "$respuesta" == "Y" ] || [ "$respuesta" == "y" ] || [ "$respuesta" == "yes" ]
    then
	./.sendmail/scripts/limpia.sh
	echo "Operacion lista: Los archivos de configuracion están listos para usarse."
    fi
else
    echo "Para usar automatizador deberá ingresar como parámetro una acción:"
    echo "1. ./main.sh config - Configura por primera vez las carpetas."
    echo "2. ./main.sh pull - Actualiza los repositorios."
    echo "3. ./main.sh califica - Envia correos y realiza push a los repositorios."
    echo "4. ./main.sh limpia - Para quitar recursivamente todos los archivos basura de todas las carpetas hijas."
    echo "5. ./main.sh califica-no-repo - Para enviar correo con la calificación."
fi
