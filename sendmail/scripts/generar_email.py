#!/usr/local/bin/python
# -*- coding: utf-8 -*-

 # -----------------------------------------------------------------
 # generar_email.py
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

import ConfigParser
import sys
import os
import datetime
def get_observaciones(file_name):
    if os.path.exists(file_name):
        with open(file_name, 'r') as myfile:
            data = myfile.read()
            return data
    else:
        return "Ninguna"


def sustituye(asunto, nombre, actividad, obs, cal, file_path):
    f = open(file_path,'r')
    filedata = f.read()
    f.close()
    
    newdata = filedata.replace("#ASUNTO#",asunto)
    newdata = newdata.replace("#NOMBRE#",nombre) 
    newdata = newdata.replace("#ACTIVIDAD#",actividad)
    newdata = newdata.replace("#OBSERVACIONES#",obs)
    newdata = newdata.replace("#CALIFICACION#",cal)
    newdata = newdata.replace("#FECHA#",str(datetime.datetime.now()))

    f = open(file_path,'w')
    f.write(newdata)
    f.close()

def genera_email(email):
    f = open("correo.txt", 'w')
    f.write(email)
    f.close()

def main():
    name_file = sys.argv[1]

    configParser = ConfigParser.RawConfigParser()   
    configFilePath = name_file
    configParser.read(configFilePath)

    asunto = configParser.get('DATOS', 'ASUNTO')
    nombre = configParser.get('DATOS', 'NOMBRE')
    actividad = configParser.get('DATOS', 'ACTIVIDAD')
    observaciones = configParser.get('DATOS', 'OBSERVACIONES')
    observaciones = get_observaciones(observaciones)
    
    calificacion = configParser.get('DATOS', 'CALIFICACION')
    email = configParser.get('MAIL', 'EMAIL')

    sustituye(asunto, nombre, actividad,
              observaciones, calificacion, sys.argv[2])
    
    genera_email(email)
    
if __name__ == "__main__":
    main()
