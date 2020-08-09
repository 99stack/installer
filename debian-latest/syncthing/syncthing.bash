#!/bin/bash

# Add key and repo for latest version of Syncthing
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb https://apt.syncthing.net/ syncthing release" | sudo tee /etc/apt/sources.list.d/syncthing.list

# Update system and packages
sudo apt-get update && sudo apt-get upgrade -y

# Install syncthing
sudo apt-get install syncthing -y

# Create config directory under /etc/syncthing
sudo mkdir /etc/syncthing
sudo chmod 755 /etc/syncthing
sudo chown www-data:www-data /etc/syncthing

# Startup syncthing to create config files
sudo -u www-data /usr/bin/syncthing -no-browser -home="/etc/syncthing"

# Allow remote connections, Important: login to web UI and set a password
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/syncthing/config.xml
sudo chown www-data:www-data /etc/syncthing
