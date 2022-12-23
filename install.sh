#!/bin/bash

read -p "Enter iOS version: " ios

# check file palera1n-v1.4.1.deb exists
if [ ! -f palera1n-v1.4.1.deb ]; then
	echo "File palera1n-v1.4.1.deb not found!"
	exit 1
fi

sudo apt-get update

sudo add-apt-repository universe

sudo apt-get update


sudo apt install libimobiledevice-utils libusbmuxd-tools git curl python3-pip -y

sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb

sudo apt-get update

wget https://github.com/Github-Aiko/palera1n-deb/releases/download/v1.4.1/palera1n-v1.4.1.deb

sudo dpkg -i palera1n-v1.4.1.deb

sudo systemctl stop usbmuxd

sudo usbmuxd -f -p

sudo ./palera1n.sh --tweaks $ios --semi-tethered


