#!/bin/sh

### BEGIN INIT INFO
# Provides:          NTP_update.sh
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start NTP_update.sh at boot time
# Description:       Set TIMEZONE at start by exec NTP_update.sh at boot time.
### END INIT INFO
# TIMEZONE | Juliano Piassa | Juliano@oozo.tv | v0.96.1

sudo service ntp stop
sudo ntpdate a.ntp.br b.ntp.br c.ntp.br
sudo service ntp start
sudo service ntp restart
