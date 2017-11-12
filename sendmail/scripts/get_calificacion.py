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
    calificacion = configParser.get(divison, 'calificacion')
    print calificacion


if __name__ == "__main__":
    main()
