#!/bin/bash

 # -----------------------------------------------------------------
 # enviar_correos.sh
 # version 1.0
 # Copyright (C) 2017  Jose Ricardo Rodriguez Abreu.
 # Facultad de Ciencias,
 # Universidad Nacional Autonoma de Mexico, Mexico.
 #
 # Este programa es software libre; se puede redistribuir
 # y/o modificar en los terminos establecidos por la
 # Licencia Publica General de GNU tal como fue publicada
 # por la Free Software Foundation en la version 2 o
 # superior.
 #
 # Este programa es distribuido con la esperanza de que
 # resulte de utilidad, pero SIN GARANTIA ALGUNA; de hecho
 # sin la garantia implicita de COMERCIALIZACION o
 # ADECUACION PARA PROPOSITOS PARTICULARES. Vease la
 # Licencia Publica General de GNU para mayores detalles.
 #
 # Con este programa se debe haber recibido una copia de la
 # Licencia Publica General de GNU, de no ser asi, visite el
 # siguiente URL:
 # http://www.gnu.org/licenses/gpl.html
 # o escriba a la Free Software Foundation Inc.,
 # 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 # -----------------------------------------------------------------
 #

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
	location="$(pwd)/sendmail"
	cp "$location/mails/email.txt" $D
	cd $D
	python "$location/scripts/generar_email.py" ./config.cfg ./email.txt
	correo="$(cat ./correo.txt)"
	echo $correo
	echo $correo >> "$location/salida.log"
	sendmail  $correo < ./email.txt
	rm ./correo.txt
	rm ./email.txt
	cd $base
	unset base
	unset location
	unset correo
    fi
    
done
