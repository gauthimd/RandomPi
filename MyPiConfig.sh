#!/bin/bash
#This is a script for customizing a fresh Debian Jessie on a Raspberry Pi 3
#Mike Gauthier Feb. 2017
set -ex   #Show commands and quit if error
sudo sed -i 's/^  en_GB/# en_GB/g' /etc/locale.gen #Comment out en_GB
sudo sed -i 's/^# en_US.UTF-8/  en_US.UTF-8/g' /etc/locale.gen  #Uncomment en_US
sudo sed -i 's/GB/US/g' /etc/default/locale  #Change locale from GB to US
sudo bash -c 'echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale'  #More locale changes
sudo bash -c 'echo "LANGUAGE=en_US.UTF-8" >> /etc/default/locale' #Change language to en_US
sudo locale-gen  #Generate locale en_US.UTF-8
sudo update-locale    #Update changes to update-locale
sudo bash -c 'echo "US/Central" > /etc/timezone'   #Update timezone to US/Central
sudo sed -i 's/country=GB/country=US/g' /etc/wpa_supplicant/wpa_supplicant.conf  #Set wifi country to US
sudo sed -i 's/XKBLAYOUT="gb"/XKBLAYOUT="us"/g' /etc/default/keyboard  #Change keyboard layout to US
sudo bash -c "echo -e 'network={\n\tssid=\"*******\"\n\tpsk=\"*******\"\n\tkey_mgmt=WPA-PSK\n}' \
		>> /etc/wpa_supplicant/wpa_supplicant.conf" #Add network and password
sudo /etc/init.d/networking restart    #Restart network daemon
sudo ifup wlan0   #Turn on wifi
sleep 15   #Wait for wifi to connect
sudo apt-get -y update   #Get updates from raspian repos
sudo apt-get -y upgrade   #Install updates/upgrades
sudo apt-get -y autoremove   #Cleanup from upgrades
sudo apt-get -y install vim sl lolcat toilet fortune cowsay     #Get all these linux apps
sudo bash -c "echo -e 'syntax on\nset background=dark\ncolo delek' > /etc/vim/vimrc.local"  #My vim configs
mkdir ~/bin   #Make a directory 
PATH=$PATH:$HOME/bin   #Add directory to path
cd ~/   #Go to home directory
sudo rm -r Documents/ Music/ Pictures/ Public/ python_games/ Templates/ Videos/ #Remove folders not used
sudo /etc/init.d/ssh start    #Turn on ssh server
sudo update-rc.d ssh defaults   #Make ssh changes permanent
sl-h -al    #ASCII steam locomotive
toilet COMPLETE --gay   #Rainbow colored message
fortune | cowsay | lolcat   #Yields rainbox colored fortune telling cow
sleep 15   #Time to absorb wisdom of rainbow cow
sudo reboot  #Reboot for changes to take affect
