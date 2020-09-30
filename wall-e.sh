#!/bin/bash

# This is my basic firewall setup script using ufw
# orion


#BANNER
echo "+---------------------------------------------+"
echo "                    Wall-E                     "
echo ""
echo "              Quick UFW Firewall               "
echo "+---------------------------------------------+"
sleep 1
#find package manager to make sure ufw is installed




if which apt; then
  pm=$(which apt)
elif which yum; then
	pm=$(which yum)
elif which apt-get; then
	pm=$(which apt-get)
else
	echo "Can't find package manager! Won't be able to install ufw."
fi




#make sure we got ufw installed
if ! which ufw; then
	$pm install -y ufw && printf "\nUFW Successfully Installed\n" || printf "\nCouldn't install ufw!\n" 
fi




#print out current config
printf "\n----Current Firewall Rules----\n\n"
sudo ufw status
sleep 3




#Closing All Ports
printf "\nNOW CLOSING ALL PORTS\nYOU HAVE 7 SECONDS TO CTRL+C TO ABORT\n\n"
sleep 7

sudo ufw default deny incoming > /dev/null 2>&1
sudo ufw default allow outgoing > /dev/null 2>&1

printf "All ports have been closed\n"


#Here is where I want to get input from user on what ports to open
while true; do
  read -p "Enter a port to open press enter after your done: " port
  [[ -z $port ]] && break
  sudo ufw allow $port
done




#Start up the firewall and print the config
#printf "\nFirewall Configuration\n\n"

sudo ufw enable 


printf "\n\n----Firewall Configuration----\n\n"
sudo ufw status




printf "\n----Netstat output----\n\n"
sleep 2

netstat -tulpn | grep LISTEN
