#!/bin/sh
#Usa scrot para tirar ss da tela com qualidade 100% + thumb com 25% no diretório $HOME

DISPLAY=:0 /usr/bin/scrot -q 75 /home/pi/%d-%m-%Y_%H:%M_cliente.jpg > /dev/null
