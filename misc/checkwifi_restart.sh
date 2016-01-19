# Reinicia sistema quando não existe conexão com a internet.
# Juliano Piassa | juliano@oozo.tv 
# Adicionado no crontab para rodar de 30 em 30 minutos.


ping -c4 www.google.com > /dev/null
 
if [ $? != 0 ] 
then
  #echo "No network connection, restarting eth0"
  /sbin/ifdown 'wlan0'
  sleep 5
  /sbin/ifup --force 'wlan0'
  sleep 600
	ping -c4 www.google.com > /dev/null
	if [ $? != 0 ]
	then
  	sudo /sbin/shutdown -r now
fi