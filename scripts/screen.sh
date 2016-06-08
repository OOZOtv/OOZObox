#!/bin/sh
#Usa scrot para tirar ss da tela com qualidade 100% + thumb com 25% no diretório $HOME

DISPLAY=:0 /usr/bin/scrot -q 100 /home/pi/%d-%m-%Y_%H:%M:%S_cliente.jpg -t 25 > /dev/null
