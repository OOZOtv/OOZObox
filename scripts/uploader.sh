#!/bin/sh
#Define *.jpg mais antigo no dir ($HOME) e upa o mesmo pro dropbox
#Definir diretório TARGET no final

ultimo=$(ls -t *.jpg | head -1)

./dropbox_uploader.sh upload /home/pi/"$ultimo" /