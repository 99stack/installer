#!/bin/bash

# Automated installation of latest nginx, php-fpm, haproxy and syncthing on latest version of debian or debian based distros
# Before running, set your configuration options below

# Change apt sources to debian 10 (stable) from 8 and 9
sudo sed -i -e 's/stretch/buster/g' /etc/apt/sources.list
sudo sed -i -e 's/jessie/buster/g' /etc/apt/sources.list

# Update system
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install apt-transport-https -y
sudo apt-get dist-upgrade -y

# Download and add apt keys
wget -q https://nginx.org/keys/nginx_signing.key -O- | sudo apt-key add -
wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -

# Download apt sources
sudo mkdir -p /etc/apt/sources.list.d
cd /etc/apt/sources.list.d
sudo wget -q https://raw.githubusercontent.com/99stack/installer/master/debian-latest/nginx-with-php-fpm/web.list

# Install packages
sudo apt-get update && sudo apt-get install nginx php-fpm haproxy curl fail2ban -y

# Create nginx config dirs
sudo mkdir -p /etc/nginx/conf.d
sudo mkdir -p /etc/nginx/sites-available
sudo mkdir -p /etc/nginx/sites-enabled

# Download nginx config
cd /etc/nginx && sudo rm nginx.conf
sudo wget -q https://raw.githubusercontent.com/99stack/installer/master/debian-latest/nginx-with-php-fpm/nginx.conf

# Restart nginx webserver
sudo systemctl restart nginx

# Cleanup 
sudo apt-get autoremove -y
