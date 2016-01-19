# arquivo de update da OOZO.tv
# BETA
# Aponta para um arquivo de config

sudo wget --no-check-certificate -P /home/pi/oozo_files http://bit.ly/oozo-update
sleep 30
sudo mv /home/pi/oozo_files/oozo-update /home/pi/oozo_files/update.sh
sudo chmod +x /home/pi/oozo_files/update.sh
sudo chmod 775 /home/pi/oozo_files/update.sh
#sudo /sbin/shutdown -r now

