#!/bin/bash
# iNSTALL ALL NECESSARY FILES TO USE OOZO.TV ON A RASPBERRY PI.
# Made by Juliano Piassa | juliano@oozo.tv
# http://www.oozo.tv

echo " Main script to use OOZO.tv on a raspberry pi." 

echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."
echo "YOU must be root."

sudo mkdir /home/pi/oozotv
sudo mkdir /home/pi/.config/autostart
sudo mkdir /home/pi/oozotv/logs
sudo mkdir /home/pi/oozotv/oozo_files
sudo mkdir /home/pi/oozotv/screens
sudo mkdir /home/pi/oozotv/speedtest
sudo mkdir /home/pi/oozotv/ping

#Download all necessary files.
sudo wget --no-check-certificate -P /usr/local/bin https://www.dropbox.com/s/20krtcpx7zon7wc/checkwifi_restart.sh?dl=1
sudo wget --no-check-certificate -P /usr/local/bin https://www.dropbox.com/s/ovsdn45u7xmg1lr/checkwifi.sh?dl=1
sudo wget --no-check-certificate -P /usr/local/bin https://www.dropbox.com/s/92kr6lgrqfzguql/checketh.sh?dl=1
sudo wget --no-check-certificate -P /home/pi https://www.dropbox.com/s/u9jcqe1ztr9il7l/oozo.tar?dl=1
sudo wget --no-check-certificate -P /home/pi/oozotv https://www.dropbox.com/s/kd2u6qs5rdo8dor/desktop-background.png?dl=1
#sudo wget --no-check-certificate -P /home/pi/oozotv http://steinerdatenbank.de/software/kweb3-1.6.4-autoplay.tar.gz
sudo wget --no-check-certificate -P /home/pi/oozotv https://www.dropbox.com/s/66syjt6vmgzkttf/oozo.desktop?dl=1
sudo wget --no-check-certificate -P /home/pi/.config/autostart https://www.dropbox.com/s/66syjt6vmgzkttf/oozo.desktop?dl=1
sudo wget --no-check-certificate -P /home/pi/.config/pcmanfm/LXDE-pi https://www.dropbox.com/s/n0r8wqdjj494apo/desktop-items-0.conf?dl=1
sudo wget --no-check-certificate -P /home/pi/oozotv https://www.dropbox.com/s/e84x86odlmf56ku/NTP_update.sh?dl=1
sudo wget --no-check-certificate -P /usr/local/bin https://www.dropbox.com/s/ovsdn45u7xmg1lr/checkwifi.sh?dl=1
sudo wget --no-check-certificate -P /home/pi/oozotv https://www.dropbox.com/s/g7z8sy24jrfg75g/config.txt?dl=1
sudo wget --no-check-certificate -P /home/pi/oozotv https://www.dropbox.com/s/j2031636mppik6b/crontab?dl=1
sudo wget --no-check-certificate -P /etc https://www.dropbox.com/s/owmcd3mcfffp8lf/splash.png?dl=1
sudo wget --no-check-certificate -P /home/pi/oozotv https://www.dropbox.com/s/wbirxsn08czbml4/lightdm.conf?dl=1
sudo wget --no-check-certificate -P /home/pi/oozotv/speedtest https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py
sudo wget --no-check-certificate -P /home/pi/oozotv https://www.dropbox.com/s/e4vj0erki1a8ph7/autostart?dl=1 
sudo wget --no-check-certificate -P /home/pi/oozotv https://www.dropbox.com/s/103pnsesluicid9/hostname?dl=1
sudo wget --no-check-certificate -P /home/pi/oozotv https://www.dropbox.com/s/bv4wn0b1b2z6q7q/hosts?dl=1
#sudo wget --no-check-certificate -P /etc/init.d https://www.dropbox.com/s/qq7ndjzwl6bp0q8/asplashscreen.sh?dl=1

#Rename files 
sudo rm /etc/hosts
sudo rm /etc/hostname
sudo rm /boot/config.txt
sudo rm /etc/lightdm/lightdm.conf
sudo rm /home/pi/.config/lxsession/LXDE-pi/autostart
#sudo mv /etc/init.d/asplashscreen.sh?dl=1 /etc/init.d/asplashscreen.sh
#sudo mv /etc/splash.png?dl=1 /etc/splash.png
sudo mv /home/pi/oozotv/hostname?dl=1 /etc/hostname
sudo mv /home/pi/oozotv/hosts?dl=1 /etc/hosts
sudo mv /home/pi/oozotv/autostart?dl=1 /home/pi/.config/lxsession/LXDE-pi/autostart
sudo mv /home/pi/oozotv/lightdm.conf?dl=1 /etc/lightdm/lightdm.conf
sudo mv /home/pi/oozotv/config.txt\?dl\=1 /boot/config.txt
sudo mv /home/pi/oozotv/oozo.desktop?dl=1 /home/pi/Desktop/oozo.desktop
sudo mv /home/pi/oozotv/desktop-background.png?dl=1 /home/pi/oozotv/oozo_files/desktop-background.png
sudo mv /home/pi/oozo.tar?dl=1 /home/pi/oozo.tar
#sudo mv /home/pi/.config/autostart/oozo.desktop?dl=1 /home/pi/.config/autostart/oozo.desktop
sudo mv /home/pi/oozotv/NTP_update.sh?dl=1 /home/pi/oozotv/NTP_update.sh
sudo mv /home/pi/oozotv/NTP_update.sh /etc/init.d/NTP_update.sh
sudo mv /usr/local/bin/checkwifi.sh?dl=1 /usr/local/bin/checkwifi.sh
sudo mv /usr/local/bin/checkwifi_restart.sh?dl=1 /usr/local/bin/checkwifi_restart.sh
sudo mv /usr/local/bin/checketh.sh?dl=1 /usr/local/bin/checketh.sh
sudo mv /home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf?dl=1 /home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
sudo mv /home/pi/oozotv/crontab?dl=1 /home/pi/oozotv/crontab

sudo tar -xvf oozo.tar
sudo mv /home/pi/oozo_init /home/pi/oozotv
sudo tar -xzf kweb3-1.6.9-autoplay.tar.gz
sudo apt-get -y install ntpdate 
sudo apt-get -y install ntp
sed -i 's/\r$//' /etc/init.d/NTP_update.sh
#sudo apt-get -y install xscreensaver
sudo crontab /home/pi/oozotv/crontab
#Give all permissions
#sudo chmod a+x /etc/init.d/asplashscreen.sh
sudo chmod 644 /etc/hostname
sudo chmod 644 /etc/hosts
sudo chmod +x /home/pi/oozotv/speedtest/speedtest_cli.py
sudo chmod +x /usr/local/bin/checkwifi.sh
sudo chmod +x /usr/local/bin/checketh.sh
sudo chmod +x /usr/local/bin/checkwifi_restart.sh
sudo chmod +x debinstall install ktop prepare remove removeall
sudo chmod +x /home/pi/oozotv/oozo_init/oozo_init.py
sudo chmod +x /etc/init.d/NTP_update.sh
sudo chmod -R 775 /home/pi/oozotv/oozo_init
sudo chmod 775 /home/pi/oozotv/crontab
sudo chmod 775 /usr/local/bin/checkwifi.sh
sudo chmod 775 /usr/local/bin/checketh.sh
sudo chmod 775 /usr/local/bin/checkwifi_restart.sh
sudo chmod 775 /etc/init.d/NTP_update.sh
sudo chmod 777 /home/pi/.config/lxsession/LXDE-pi/autostart
#sudo chmod 777 /home/pi/.config/autostart/oozo.desktop
update-rc.d NTP_update.sh defaults
sudo wget https://yt-dl.org/latest/youtube-dl -O /usr/bin/youtube-dl
sudo chmod a+x /usr/bin/youtube-dl
#sudo apt-get -y update 
sudo apt-get -y install fbi
#sudo apt-get -y install libgtk-3-dev
sudo apt-get -y install python-pip
sudo pip install wifi
sudo pip install configparser
sudo chmod 755 /etc/network/interfaces
#sudo dpkg -i libavformat53_0.8.17-1+rp1_armhf.deb
sudo ./debinstall
#sudo insserv /etc/init.d/asplashscreen
#sudo mv kweb3 /usr/bin
sudo chmod -R 777 /home/pi/oozotv/oozo_init
sh -c 'setterm -blank 0 -powersave off -powerdown 0 < /dev/console > /dev/console 2>&1'
sudo apt-get -y install unclutter
unclutter -idle 1 -root &
sudo mv /home/pi/check.py /home/pi/debinstall /home/pi/install /home/pi/ktop /home/pi/kweb3-1.6.4-autoplay.tar.gz /home/pi/kweb_1.6.4-1_armhf.deb /home/pi/libavformat53_0.8.17-1+rpi1_armhf.deb /home/pi/oozo.sh /home/pi/oozo.tar /home/pi/prepare /home/pi/remove /home/pi/removeall /home/pi/oozotv/oozo_files

echo "
##########################################################################################################
#OOZO.tv ready. Restarting the system NOW. If you want to cancel, please, CTRL + C will do the trick. Cya#
##########################################################################################################"
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
#sudo reboot

exit
#This_is_the_End
