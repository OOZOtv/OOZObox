#!/bin/bash
# iNSTALL ALL NECESSARY FILES TO USE OOZO.TV ON A RASPBERRY PI.
# Made by Juliano Piassa | juliano@oozo.tv
# http://www.oozo.tv

echo "This script install OOZOtv to a Raspberry Pi V1, 2, 3" 

echo "Please note: First use the expand.sh script to expand the rpi filesystem ..."

sleep 2

echo "Rpi will update, upgrade and install all pckges(...) This will take a while... (up to 20mins..)"
#Install packages
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install ntpdate 
sudo apt-get -y install ntp
sudo apt-get -y install ca-certificates-java
sudo apt-get -y install fbi
sudo apt-get -y install python-pip
sudo apt-get -y install unclutter
sudo pip install wifi
sudo pip install configparser

echo "Will clone OOZOtv GitHub"
#Clone OOZOtv Git
git clone https://github.com/OOZOtv/OOZObox

#Fix oozo.desktop file to Desktop (start icon)
sudo mv /home/pi/OOZObox/misc/oozo.desktop /home/pi/Desktop

#Place more configfiles...
sudo mv /home/pi/OOZObox/misc/desktop-items-0.conf /home/pi/.config/pcmanfm/LXDE-pi
sudo mv /home/pi/OOZObox/misc/config.txt /boot/config.txt
sudo mv /home/pi/OOZObox/misc/lightdm.conf /etc
sudo mv /home/pi/OOZObox/misc/autostart /home/pi/.config/lxsession/LXDE-pi
sudo mv /home/pi/OOZObox/misc/hosts /etc
sudo mv /home/pi/OOZObox/misc/hostname /etc
sudo mv /home/pi/OOZObox/misc/.dropbox_uploader /home/pi


echo "Will give all file permissions and modes ..."
#Give all modes and permissions
sudo chmod 644 /etc/hostname
sudo chmod 644 /etc/hosts
sudo chmod +x /home/pi/OOZObox/scripts/proc.sh
sudo chmod +x /home/pi/OOZObox/scripts/screen.sh
sudo chmod +x /home/pi/OOZObox/scripts/reboot.sh
sudo chmod +x /home/pi/OOZObox/scripts/clear.sh
sudo chmod +x /home/pi/OOZObox/scripts/uploader.sh
sudo chmod +x /home/pi/OOZObox/scripts/dropbox_uploader.sh
sudo chmod +x /home/pi/OOZObox/scripts/speedtest/speedtest_cli.py
sudo chmod +x /home/pi/OOZOtv/debinstall install ktop prepare remove removeall
sudo chmod +x /home/pi/OOZObox/oozo_init/oozo_init.py
sudo chmod +x /home/pi/Desktop/oozo.desktop
sudo chmod 644 /home/pi/OOZObox/proc.sh
sudo chmod 644 /home/pi/OOZObox/screen.sh
sudo chmod 644 /home/pi/OOZObox/reboot.sh
sudo chmod 644 /home/pi/OOZObox/clear.sh
sudo chmod 644 /home/pi/OOZObox/uploader.sh
sudo chmod 775 /home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
sudo chmod 644 /home/pi/OOZObox/dropShell.sh
sudo chmod -R 775 /home/pi/OOZObox/oozo_init
sudo chmod 644 /home/pi/OOZObox/misc/crontab
sudo chmod 777 /home/pi/.config/lxsession/LXDE-pi/autostart
sudo chmod 755 /etc/network/interfaces
sudo chmod 755 /boot/config.txt

echo "Installing Kweb3"
#Install Kweb3 (Will keep our git repo with newest)
sudo ./debinstall

#Fix new crontab file
crontab /home/pi/OOZObox/misc/crontab

#Set blank to off
sh -c 'setterm -blank 0 -powersave off -powerdown 0 < /dev/console > /dev/console 2>&1'
#Hide mouse pointer...
unclutter -idle 1 -root &

exit

