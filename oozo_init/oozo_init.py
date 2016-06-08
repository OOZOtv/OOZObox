#!/usr/bin/python
# coding=UTF-8

__author__="ogabiru"
__date__ ="$May 15, 2014 1:26:51 AM$"

import sys
from subprocess import call

try:
    from gi.repository import Gtk, Gdk, GObject
    from wifi import Cell, Scheme
    import ConfigParser
except:
    print "Error importing"
    sys.exit(1)
    
#Set the Glade file
builder = Gtk.Builder()
builder.add_from_file("/home/pi/OOZObox/oozo_init/oozo_start.glade")
                    
class OozoStart:

    def __init__(self):
        
        #Handlers
        handlers = {
            "set_network": self.set_network,
            "set_username": self.set_username
        }
        builder.connect_signals(handlers)
        
        #Internet connection check
        self.oozo_load = builder.get_object("oozo_load")
        self.oozo_load.show()
        
        #Check internet connection
        if self.check_connection():
            self.oozo_load.destroy()
            self.check_config()
        else:
            self.oozo_load.destroy()
            self.select_network()
  
    #Check connection and call the right window
    def check_connection(self):
        connection = call(['ping','-a','-c1','google.com'])
        if connection == 0:
            return True
        else:
            return False
            
    def check_config(self):
        #Load configuration
        self.config = ConfigParser.ConfigParser()
        self.config.read('/home/pi/OOZObox/oozo_init/config')
        self.username = self.config.get("user","username")
        
        if self.username == "":
            #Wifi select element
            self.oozo_config = builder.get_object("oozo_config")
            self.oozo_config.show()
        else:
            call(['/usr/bin/kweb3','-YBEKHCUAJPR','http://oozo.tv/'+self.username])
            Gtk.main_quit()
            sys.exit(1)
            
    def select_network(self):
        #Wifi select element
        self.selectwifi = builder.get_object("selectwifi")
        self.selectwifi.show()

        #List Interface
        self.list_interface = builder.get_object("list_interface")

        #List wifi networks
        ssids = [cell.ssid for cell in Cell.all('wlan0')]
        schemes = list(Scheme.all())
        
        #Fills the wifi select with available networks
        for ssid in ssids:
            self.treeiter = self.list_interface.append([ssid])
    
    #Get SSID and password and save on /etc/network/interfaces
    def set_network(self,object):
        #SSID selected
        self.combobox_network = builder.get_object("combobox_network")
        select = self.combobox_network.get_active()
        model = self.combobox_network.get_model()
        
        #Password
        self.input_network_password = builder.get_object("input_network_password")
        
        self.SSID = model[select][0]
        self.PASS = self.input_network_password.get_text()
        
        interfaces_file = 'auto lo\r\n\r\niface lo inet loopback\r\niface eth0 inet dhcp\r\n\r\nallow-hotplug wlan0\r\nauto wlan0\r\n\r\niface wlan0 inet dhcp\r\nwpa-ssid "'+self.SSID+'"\r\nwpa-psk "'+self.PASS+'"'
        
        f = open("/etc/network/interfaces","w")
        f.write(interfaces_file)
        f.close()
        
        call(['sudo','/etc/init.d/networking','stop'])
        call(['sudo','/etc/init.d/networking','start'])
        
        if self.check_connection():
            self.selectwifi.destroy()
            self.check_config()
        else:
            self.label_error = builder.get_object("label_error")
            error = "Erro de conexão."
            self.label_error.set_text(error)
        
    def set_username(self,object):
        #Username
        self.input_username = builder.get_object("input_username")
        
        self.config.set("user","username",self.input_username.get_text())
        with open("/home/pi/OOZObox/oozo_init/config","wb") as configfile:
            self.config.write(configfile)
        self.oozo_config.destroy()
        self.check_config()
        Gtk.main_quit()
        sys.exit(1)
        
if __name__ == "__main__":
    oozo = OozoStart()
    Gtk.main()