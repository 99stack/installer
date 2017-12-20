# Basic installer for exodus cryptocurrency wallet
#!/bin/bash

# Check if running user is root
if (( $EUID != 0 )); then 
	echo "Please run Exodus installer as root" 
	exit
fi

# Get version to install
echo "Enter Exodus version to install: "
read VER

# Cleanup old files
cd /home/master/Downloads
rm exodus-linux-x64-*
rm -r Exodus-linux-x64

# Download choosen version
wget https://exodusbin.azureedge.net/releases/exodus-linux-x64-$VER.zip
unzip exodus-linux-x64-$VER.zip

# Copy files to installation
mkdir /usr/sbin/exodus
rsync -ruv Exodus-linux-x64/* /usr/sbin/exodus
