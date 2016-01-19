#!/bin/bash
# Instala os pacotes necessarios para uso da OOZO.TV em ambiente LINUX usando Raspberry Pi
# Os arquivos da OOZO devem ser copiados para o Desktop
# Feito por Juliano Piassa | juliano@oozo.tv
# http://www.oozo.tv

echo "Installing OOZO.tv"
sleep 5	
echo "Updating and upgrading the system, (grab a book and chill...)"
# 1. Create necessary directories 
sudo mkdir /home/pi/.config/autostart
#Update and Upgrade the system, should take a while
sudo apt-get -qq update
sudo apt-get -y -qq upgrade
sudo apt get -y install ntpdate ntp xscreensaver python-pip libgtk-3-dev fbi watchdog git-core chkconfig
sudo pip install wifi
sudo pip install configparser
echo "cloning Git.. Please, enter user and passwd to repo"
git clone -q https://github.com/OOZOtv/OOZObox.git "$HOME/oozo" >

#2. Download necessary files to OOZO.tv
echo "Downloading necessary files ..."

sudo mv /home/pi/oozo/misc/checkwifi_restart.sh /usr/local/bin
sudo mv /home/pi/oozo/misc/checkwifi.sh /usr/local/bin
sudo mv /home/pi/oozo/misc/checketh.sh /usr/local/bin
sudo wget --no-check-certificate -P /home/pi/oozo https://s3-sa-east-1.amazonaws.com/oozofiles/oozo.tar
sudo wget --no-check-certificate -P /home/pi/oozo https://s3-sa-east-1.amazonaws.com/oozofiles/desktop-background.png
sudo wget --no-check-certificate -P /home/pi/oozo https://s3-sa-east-1.amazonaws.com/oozofiles/kweb3-1.6.4-autoplay.tar.gz
sudo wget --no-check-certificate -P /home/pi/oozo https://s3-sa-east-1.amazonaws.com/oozofiles/oozo.desktop
sudo wget --no-check-certificate -P /home/pi/.config/autostart https://s3-sa-east-1.amazonaws.com/oozofiles/oozo.desktop
sudo wget --no-check-certificate -P /home/pi/.config/pcmanfm/LXDE-pi https://s3-sa-east-1.amazonaws.com/oozofiles/desktop-items-0.conf
sudo wget --no-check-certificate -P /etc https://s3-sa-east-1.amazonaws.com/oozofiles/splash.png
sudo mv /home/pi/oozo/misc/NTP_update.sh /etc/init.d/NTP_update.sh
sudo mv /home/pi/oozo/misc/config.txt /boot/config.txt
sudo mv /home/pi/oozo/misc/asplashscreen.sh /etc/init.d 
sudo mv /home/pi/oozo/misc/reboot.sh /usr/local/bin
sudo mv /home/pi/oozo/misc/update_slave.sh /usr/local/bin
sudo rm /boot/cmdline.txt
sudo mv /home/pi/oozo/misc/cmdline.txt /boot/cmdline.txt
sudo cp /etc/init.d/NTP_update.sh /usr/local/bin/NTP_update.sh
sudo cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
sudo crontab /home/pi/oozo/misc/crontab
sudo rm /home/pi/.xscreensaver
sudo mv /home/pi/oozo/misc/OI.xscreensaver /home/pi/.xscreensaver
# Install supervisor using pip
sudo pip install supervisor==3.2.0 -q
sudo mkdir /var/log/supervisor
sudo mkdir -p /etc/supervisor/conf.d
#Untar oozo files on /home/pi
sudo tar -xzvf /home/pi/oozo/oozo.tar
#Untar autoplay update for Kweb3 GTK3 on /home/pi
tar -xzvf /home/pi/oozo/kweb3-1.6.4-autoplay.tar.gz
#Permissions 
sudo chmod a+x /etc/init.d/asplashscreen.sh
sudo chmod +x /usr/local/bin/checkwifi.sh
sudo chmod +x /usr/local/bin/checketh.sh
sudo chmod +x /usr/local/bin/checkwifi_restart.sh
sudo chmod +x /home/pi/oozo/oozo_init/debinstall
sudo chmod +x /home/pi/oozo/oozo_init/install
sudo chmod +x /home/pi/oozo/oozo_init/ktop
sudo chmod +x /home/pi/oozo/oozo_init/prepare
sudo chmod +x /home/pi/oozo/oozo_init/remove
sudo chmod +x /home/pi/oozo/oozo_init/removeall
sudo chmod +x /home/pi/oozo/oozo_init/oozo_init.py
sudo chmod +x /etc/init.d/NTP_update.sh
sudo chmod 775 /home/pi/oozo/misc/crontab
sudo chmod 775 /usr/local/bin/checkwifi.sh
sudo chmod 775 /usr/local/bin/checketh.sh
sudo chmod 775 /usr/local/bin/checkwifi_restart.sh
sudo chmod 775 /etc/init.d/NTP_update.sh
sudo chmod +x /usr/local/bin/reboot.sh
sudo chmod 775 /usr/local/bin/reboot.sh
sudo chmod +x /usr/local/bin/update_slave.sh
sudo chmod 775 /usr/local/bin/update_slave.sh

echo "Not-Ready-yet! :P"

#Config watchdog
sudo modprobe bcm2708_wdog
sudo cp /etc/modules /etc/modules.bak
sudo sed '$ i\bcm2708_wdog' -i /etc/modules
sudo chkconfig watchdog on
sudo cp /etc/watchdog.conf /etc/watchdog.conf.bak
sudo sed -e 's/#watchdog-device/watchdog-device/g' -i /etc/watchdog.conf
sudo /etc/init.d/watchdog start

#Supervisor...

#Services and updates
update-rc.d NTP_update.sh defaults
sudo wget https://yt-dl.org/latest/youtube-dl -O /usr/bin/youtube-dl
sudo chmod a+x /usr/bin/youtube-dl
sudo chmod 777 /etc/network/interfaces
cd /home/pi/oozo/oozo_init
sudo ./debinstall
sudo insserv /etc/init.d/asplashscreen
sudo mv kweb3 /usr/bin
sudo insserv /etc/init.d/asplashscreen.sh
sudo update-rc.d /etc/init.d/asplashscreen.sh start
sh -c 'setterm -blank 0 -powersave off -powerdown 0 < /dev/console > /dev/console 2>&1'

#Unclutter - Ride mouse
sudo apt-get -y install unclutter
unclutter -idle 1 -root &

sudo mv /home/pi/check.py /home/pi/debinstall /home/pi/install /home/pi/ktop /home/pi/kweb3-1.6.4-autoplay.tar.gz /home/pi/kweb_1.6.4-1_armhf.deb /home/pi/libavformat53_0.8.17-1+rpi1_armhf.deb /home/pi/oozo.sh /home/pi/oozo.tar /home/pi/prepare /home/pi/desktop-background.png /home/pi/remove /home/pi/removeall /home/pi/oozo_files

echo "
###################################################
#Instalation finished, rebooting the Raspberry Pi.#
###################################################"
sleep 1
echo "10 ..."
sleep 1
echo "9 ..."
sleep 1
echo "8 ..."
sleep 1
echo "7 ..."
sleep 1
echo "6 ..."
sleep 1
echo "5 ..."
sleep 1
echo "4 ..."
sleep 1
echo "3 ..."
sleep 1
echo "2 ..."
sleep 1
echo "1 ..."
sleep 1

sleep 2
sudo reboot

exit
# FIM