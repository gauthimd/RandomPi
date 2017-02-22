#!/bin/bash
set -ex
sudo sed -i 's/^  en_GB/# en_GB/g' /etc/locale.gen
sudo sed -i 's/^# en_US.UTF-8/  en_US.UTF-8/g' /etc/locale.gen
sudo sed -i 's/GB/US/g' /etc/default/locale
sudo bash -c 'echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale'
sudo bash -c 'echo "LANGUAGE=en_US.UTF-8" >> /etc/default/locale'
sudo locale-gen
sudo update-locale
sudo bash -c 'echo "US/Central" > /etc/timezone'
sudo sed -i 's/country=GB/country=US/g' /etc/wpa_supplicant/wpa_supplicant.conf
sudo sed -i 's/XKBLAYOUT="gb"/XKBLAYOUT="us"/g' /etc/default/keyboard
sudo bash -c "echo -e 'network={\n\tssid=\"*******\"\n\tpsk=\"*******\"\n\tkey_mgmt=WPA-PSK\n}' >> /etc/wpa_supplicant/wpa_supplicant.conf"
sudo /etc/init.d/networking restart
sudo ifup wlan0
sleep 15
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y autoremove
sudo apt-get -y install vim sl lolcat toilet fortune cowsay
sudo bash -c "echo -e 'syntax on\nset background=dark\ncolo delek' > /etc/vim/vimrc.local"
mkdir ~/bin
PATH=$PATH:$HOME/bin
cd ~/
sudo rm -r Documents/ Music/ Pictures/ Public/ python_games/ Templates/ Videos/
sudo /etc/init.d/ssh start
sudo update-rc.d ssh defaults
sl-h -al
toilet COMPLETE --gay
fortune | cowsay | lolcat
sleep 15
sudo reboot
