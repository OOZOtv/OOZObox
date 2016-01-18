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
sudo mkdir /home/pi/oozo_files
#Update and Upgrade the system, should take a while
sudo apt-get -y update > /dev/null
sudo apt-get -y upgrade > /dev/null
sudo apt get install watchdog git-core chkconfig > /dev/null

#2. Download necessary files to OOZO.tv
echo "Downloading necessary files ..."

#2.1. Script to check if there's connection on wlan0, if no, reboot the system.
sudo wget --no-check-certificate -P /usr/local/bin https://www.dropbox.com/s/20krtcpx7zon7wc/checkwifi_restart.sh?dl=1 > /dev/null
echo ".. 10% of files downloaded....>"
#2.2. Script to check if there's connection on wlan0, if no, /sbin reload.
sudo wget --no-check-certificate -P /usr/local/bin https://www.dropbox.com/s/ovsdn45u7xmg1lr/checkwifi.sh?dl=1 > /dev/null
echo ".. 14% of files downloaded.....>"
#2.3. Script to check if there's connection on eth0, if no, restart eth0 and reboot the system.
sudo wget --no-check-certificate -P /usr/local/bin https://www.dropbox.com/s/92kr6lgrqfzguql/checketh.sh?dl=1 > /dev/null
echo ".. 21% of files downloaded......>"
#Tar with kweb & python
sudo wget --no-check-certificate -P /home/pi https://www.dropbox.com/s/u9jcqe1ztr9il7l/oozo.tar?dl=1 > /dev/null
echo ".. 27% of files downloaded.......>"
#BG
sudo wget --no-check-certificate -P /home/pi https://www.dropbox.com/s/kd2u6qs5rdo8dor/desktop-background.png?dl=1 > /dev/null
echo ".. 34% of files downloaded........>"
#kweb updates to autoplays movies on iframe
sudo wget --no-check-certificate -P /home/pi http://steinerdatenbank.de/software/kweb3-1.6.4-autoplay.tar.gz > /dev/null
echo ".. 41% of files downloaded.........>"
#Python - Desktop shortcut to oozo.tv
sudo wget --no-check-certificate -P /home/pi/ https://www.dropbox.com/s/66syjt6vmgzkttf/oozo.desktop?dl=1 > /dev/null
echo ".. 49% of files downloaded..........>"
#Python autostart - stats oozo.tv at 1st boot
sudo wget --no-check-certificate -P /home/pi/.config/autostart https://www.dropbox.com/s/66syjt6vmgzkttf/oozo.desktop?dl=1 > /dev/null
echo ".. 55% of files downloaded...........>"
#Apply wallpaper to pcman
sudo wget --no-check-certificate -P /home/pi/.config/pcmanfm/LXDE-pi https://www.dropbox.com/s/n0r8wqdjj494apo/desktop-items-0.conf?dl=1 > /dev/null
echo ".. 63% of files downloaded............>"
#Timezone services 
sudo wget --no-check-certificate -P /home/pi https://www.dropbox.com/s/e84x86odlmf56ku/NTP_update.sh?dl=1 > /dev/null
echo ".. 74% of files downloaded.............>"
#Boot configuration file - Overclock, resolution and screen orientation - do not change
sudo wget --no-check-certificate -P /home/pi https://www.dropbox.com/s/g7z8sy24jrfg75g/config.txt?dl=1 > /dev/null
echo ".. 79% of files downloaded..............>"
#Cron with services and times
sudo wget --no-check-certificate -P /home/pi https://www.dropbox.com/s/j2031636mppik6b/crontab?dl=1 > /dev/null
echo ".. 83% of files downloaded...............>"
#OOZO image on bootscreen
sudo wget --no-check-certificate -P /etc https://www.dropbox.com/s/owmcd3mcfffp8lf/splash.png?dl=1 > /dev/null
echo ".. 87% of files downloaded................>"
#OOZO image on bootscreen - Script 
sudo wget --no-check-certificate -P /etc/init.d https://www.dropbox.com/s/qq7ndjzwl6bp0q8/asplashscreen.sh?dl=1 > /dev/null
echo ".. 91% of files downloaded.................>"
#Download restart.sh - Reboot every day at: 16h20 and 00:00
sudo wget --no-check-certificate -P /usr/local/bin https://www.dropbox.com/s/tvh2ncyta30raxw/reboot.sh?dl=1 > /dev/null
echo ".. 94% of files downloaded..................>"
#Update
sudo wget --no-check-certificate -P /usr/local/bin https://www.dropbox.com/s/7he5qlviv5m3e0i/update_slave.sh?dl=1 > /dev/null
echo ".. 97% of files downloaded...................>"
#Imgboot swap
sudo wget --no-check-certificate -P /home/pi https://www.dropbox.com/s/64ly5etx3ixncl2/cmdline.txt?dl=1 > /dev/null
echo ".. 98% of files downloaded....................>"

sudo wget --no-check-certificate -P /home/pi https://www.dropbox.com/s/2a0sl9uvsdjhldj/OI.xscreensaver?dl=1 > /dev/null
#python brutessh.py -h 192.168.1.150 -u pi -d passlist.txt
echo ".. 100% of files downloaded....................>"

# Install supervisor using pip
sudo pip install supervisor==3.2.0 -q > /dev/null
sudo mkdir /var/log/supervisor
sudo mkdir -p /etc/supervisor/conf.d

echo "Files downloaded, setting up instalation directories and dependencies ..."

#Rename and move files to final directories
sudo mv /home/pi/cmdline.txt?dl=1 /home/pi/cmdline.txt
sudo rm /boot/cmdline.txt
sudo mv /home/pi/cmdline.txt /boot/cmdline.txt
sudo mv /etc/init.d/asplashscreen.sh?dl=1 /etc/init.d/asplashscreen.sh
sudo mv /etc/splash.png?dl=1 /etc/splash.png
sudo mv /home/pi/config.txt\?dl\=1 /boot/config.txt
sudo mv /home/pi/oozo.desktop?dl=1 /home/pi/Desktop/oozo.desktop
sudo mv /home/pi/desktop-background.png?dl=1 /home/pi/desktop-background.png
sudo mv /home/pi/oozo.tar?dl=1 /home/pi/oozo.tar
sudo mv /home/pi/.config/autostart/oozo.desktop?dl=1 /home/pi/.config/autostart/oozo.desktop
sudo mv /home/pi/NTP_update.sh?dl=1 /home/pi/NTP_update.sh
sudo mv /home/pi/NTP_update.sh /etc/init.d/NTP_update.sh
sudo cp /etc/init.d/NTP_update.sh /usr/local/bin/NTP_update.sh
sudo mv /usr/local/bin/checkwifi.sh?dl=1 /usr/local/bin/checkwifi.sh
sudo mv /usr/local/bin/checkwifi_restart.sh?dl=1 /usr/local/bin/checkwifi_restart.sh
sudo mv /usr/local/bin/checketh.sh?dl=1 /usr/local/bin/checketh.sh
sudo mv /home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf?dl=1 /home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
sudo mv /home/pi/crontab?dl=1 /home/pi/crontab
sudo mv /usr/local/bin/reboot.sh?dl=1 /usr/local/bin/reboot.sh
sudo mv /usr/local/bin/update_slave.sh?dl=1 /usr/local/bin/update_slave.sh
sudo mv /home/pi/oozo/oozo_init /home/pi
#Copy files to get the TIMEZONE done.
sudo cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

echo "Setting up permissions ..."

#Untar oozo files on /home/pi
sudo tar -xzvf oozo.tar
#Untar autoplay update for Kweb3 GTK3 on /home/pi
tar -xzvf kweb3-1.6.4-autoplay.tar.gz
#Install NTPDATE - Addon to NTP service
sudo apt-get -y install ntpdate 
#Install NTP
sudo apt-get -y install ntp
#sed -i 's/\r$//' NTP_update.sh
#Manager to energy and desktop movies
sudo apt-get -y install xscreensaver
#Make our custom crontab file in to main file
sleep 2
sudo rm /home/pi/.xscreensaver
sudo mv /home/pi/OI.xscreensaver?dl=1 /home/pi/.xscreensaver
sudo crontab /home/pi/crontab

#Permissions 
sudo chmod a+x /etc/init.d/asplashscreen.sh
sudo chmod +x /usr/local/bin/checkwifi.sh
sudo chmod +x /usr/local/bin/checketh.sh
sudo chmod +x /usr/local/bin/checkwifi_restart.sh
sudo chmod +x /home/pi/oozo/debinstall
sudo chmod +x /home/pi/oozo/install
sudo chmod +x /home/pi/oozo/ktop
sudo chmod +x /home/pi/oozo/prepare
sudo chmod +x /home/pi/oozo/remove

sudo chmod +x /home/pi/oozo/removeall
sudo chmod +x /home/pi/oozo_init/oozo_init.py
sudo chmod +x /etc/init.d/NTP_update.sh
sudo chmod 775 /home/pi/crontab
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
sudo modprobe bcm2708_wdog > /dev/null
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
#sudo apt-get -y update 
sudo apt-get -y install fbi
sudo apt-get -y install libgtk-3-dev
sudo apt-get -y install python-pip
sudo pip install wifi
sudo pip install configparser
sudo chmod 777 /etc/network/interfaces
sudo dpkg -i libavformat53_0.8.17-1+rp1_armhf.deb
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
