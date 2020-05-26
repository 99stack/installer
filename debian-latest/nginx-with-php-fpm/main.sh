#!/bin/bash

# Automated installation of latest nginx, php-fpm, haproxy and syncthing on latest version of debian or debian based distros
# Before running, set your configuration options below

# Download and add apt keys
wget -q https://nginx.org/keys/nginx_signing.key -O- | sudo apt-key add -
wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
wget -q https://syncthing.net/release-key.txt -O- | sudo apt-key add -

# Download apt sources
wget -q https://raw.githubusercontent.com/99stack/installer/master/debian-latest/nginx-with-php-fpm/web.list -o src.sh | sudo mv src.sh /etc/apt/sources.list.d/web.list

# Update system
sudo apt-get update && sudo apt-get upgrade -y

# Install packages
sudo apt-get install nginx php-fpm syncthing haproxy curl

# Download nginx config
wget -q https://raw.githubusercontent.com/99stack/installer/master/debian-latest/nginx-with-php-fpm/web.list -o src.sh | sudo mv src.sh /etc/nginx/nginx.conf
