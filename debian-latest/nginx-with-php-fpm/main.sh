#!/bin/bash

# Automated installation of latest nginx, php-fpm, haproxy and syncthing on latest version of debian or debian based distros

# Allow installation from https sources
sudo apt-get install apt-transport-https curl gnupg2 ca-certificates lsb-release -y

# Add mainline repos for nginx and php-fpm
echo "deb http://nginx.org/packages/mainline/ubuntu/ bionic nginx" | sudo tee /etc/apt/sources.list.d/nginx.list

# Download and include apt keys for nginx and php
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -
sudo wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add -

# Download apt sources
sudo mkdir -p /etc/apt/sources.list.d
cd /etc/apt/sources.list.d
sudo wget -q https://raw.githubusercontent.com/99stack/installer/master/debian-latest/nginx-with-php-fpm/web.list

# Update package sources
sudo apt-get update

# Install packages for monitoring, maintenance and clock sync
sudo apt-get -y install curl rsync htop ntp nmap nload zip unzip git

# Install packages for firewall, load balance and syncthing
sudo apt-get -y install haproxy fail2ban syncthing

# Install nginx and plugins
sudo apt-get -y install nginx

# Install php-fpm and plugins
sudo apt-get -y install php-fpm php-common php-mbstring php-curl php-gd php-json php-xml php-zip php-imap php-yaml php-mongodb php-pgsql php-mysql

# Create nginx config dirs
sudo mkdir -p /etc/nginx/conf.d
sudo mkdir -p /etc/nginx/sites-available
sudo mkdir -p /etc/nginx/sites-enabled

# Download nginx config
cd /etc/nginx && rm nginx.conf
sudo wget -q https://raw.githubusercontent.com/99stack/installer/master/debian-latest/nginx-with-php-fpm/nginx.conf

# Restart services to apply config updates
sudo systemctl restart nginx
sudo systemctl restart php7.4-fpm

# Cleanup 
sudo apt-get -y autoremove
