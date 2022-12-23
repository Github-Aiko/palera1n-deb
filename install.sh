#!/bin/bash

read -p "Enter iOS version: " ios

sudo apt-get update

sudo add-apt-repository universe

sudo apt-get update

sudo apt install libimobiledevice-utils libusbmuxd-tools git curl python3-pip wget -y

if [ ! -f libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb ]; then
	wget https://github.com/Github-Aiko/palera1n-deb/raw/master/libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb
fi

sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb

sudo apt-get update

# check file palera1n-v1.4.1.deb exists
if [ ! -f palera1n-v1.4.1.deb ]; then
	wget https://github.com/Github-Aiko/palera1n-deb/releases/download/v1.4.1/palera1n-v1.4.1.deb
fi

sudo dpkg -i palera1n-v1.4.1.deb

sudo systemctl stop usbmuxd

sudo usbmuxd -f -pios

cd /etc/palera1n

sudo ./palera1n.sh --tweaks $ios --semi-tethered

