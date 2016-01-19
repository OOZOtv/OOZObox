#!/bin/bash

LOGFILE=/home/pi/network-monitor.log

if ifconfig eth0 | grep -q "inet addr:" ;
then
        echo "$(date "+%m %d %Y %T") : Ethernet OK" >> $LOGFILE
else
        echo "$(date "+%m %d %Y %T") : Conexão DOWN, tentando reconectar ..." >> $LOGFILE
        ifup --force eth0
        OUT=$? #save exit status of last command to decide what to do next
        if [ $OUT -eq 0 ] ; then
                STATE=$(ifconfig eth0 | grep "inet addr:")
                echo "$(date "+%m %d %Y %T") : Conexão resetara. O STATUS ATUAL da conexão é" $STATE >> $LOGFILE
        else
                echo "$(date "+%m %d %Y %T") : Erro ao resetar conexão com a INTERNET" >> $LOGFILE
        fi
fi