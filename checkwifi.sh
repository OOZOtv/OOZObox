# Check internet connection and Refresh all interfaces to re-connect to wifi/eth 
# Juliano Piassa | Juliano@oozo.tv

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