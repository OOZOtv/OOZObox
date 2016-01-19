#OOZO UPDATER

sudo wget --no-check-certificate -P /home/pi/Desktop https://www.dropbox.com/s/ok4yi3yibfjr5m7/2387974302_c943e77388_o.jpg?dl=1
sleep 3
sudo service ntp stop
sleep 1
ntpdate a.ntp.br b.ntp.br c.ntp.br
sleep 1
sudo service ntp start
sleep 1
sudo service ntp restart
sleep 3
sudo sbin/shutdown -r now

