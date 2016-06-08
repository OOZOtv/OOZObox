#!/bin/bash
# expand the Rpi Fylesistem

echo "Please,note that this script need to be exec before the oozo.sh main install script ...."

sleep 3

sudo raspi-config --expand-rootfs

sleep 5

sudo reboot