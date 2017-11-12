#!/usr/bin/python

import ConfigParser
import sys
import os

def main():
    name_file = sys.argv[1]

    configParser = ConfigParser.RawConfigParser()   
    configFilePath = name_file
    configParser.read(configFilePath)

    division = sys.argv[2].upper()
    observacion = configParser.get(divison, 'observaciones')
    observacion = observacion.replace(" ","").strip()
    if observacion:
        print observacion
    else:
        print -1



if __name__ == "__main__":
    main()
