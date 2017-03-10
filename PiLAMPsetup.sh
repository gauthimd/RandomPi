#!/bin/bash
#This script will get a basic LAMP stack running on a Raspberry Pi 3
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y apache2 mysql-server
mysql_secure_installation #Basic mysql server config
sudo apt-get install -y php5 php-pear php5-mysql
sudo service apache2 restart
toilet Done --gay
sleep 3
sudo reboot
