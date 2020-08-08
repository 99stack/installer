#!/bin/bash

# Add key and repo for latest version of Syncthing
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

# Update system and packages
sudo apt-get update && sudo apt-get upgrade -y

# Install syncthing
sudo apt-get install syncthing -y

# Create config directory under /etc/syncthing
sudo mkdir /etc/syncthing
sudo chmod 755 /etc/syncthing
sudo chown nginx:nginx /etc/syncthing
