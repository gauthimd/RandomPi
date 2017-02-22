#Random Raspberry Pi Scripts

##MyPiConfig.sh
Run this script on a brand new version of Raspbian Jessie. Before running the script
enter in your ssid and psk for the wifi network you wish to connect to. The script
will configure the locale for en_US.UTF-8 encoding, set the timezone to US/Central,
enable the SSH server, install the apps sl, toilet, lolcat, fortune, cowsay, and will 
create a directory ~/bin and add it to $PATH. It updates customizes vim and sets the
delek color scheme. It will run sudo apt-get update & upgrade and when the script is
complete it will reboot the pi.
