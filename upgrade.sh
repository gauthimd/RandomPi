#!/bin/bash
#A short script for upgrading you RPi and getting your fortune
#Uncomment the next line to download dependencies
#sudo apt-get install -y sl toilet fortune cowsay lolcat
sudo apt-get -y update   #Update
sudo apt-get -y upgrade   #Upgrade
sl-h -al  #Steam locomotive
toilet UPGRAYEDD --gay  #With two Ds 
fortune | cowsay | lolcat #Rainbow bovine medium
