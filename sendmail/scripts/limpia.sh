#!/bin/bash

for D in `find . -type d`
do
    base="$(pwd)"
    cd $D
    echo "Eliminando en la carpeta $D"
    rm -rf *~
    rm -rf *.class
    rm -rf *.pyc
    cd $base
done
