#!/bin/bash

# Automated installation of latest nginx, php-fpm, haproxy and syncthing on latest version of debian or debian based distros
# Before running, set your configuration options below

# Change apt sources to debian 10 (stable) from 8 and 9
sed -i -e 's/stretch/buster/g' /etc/apt/sources.list
sed -i -e 's/jessie/buster/g' /etc/apt/sources.list

# Force noninteractive prompt
DEBIAN_FRONTEND=noninteractive

# Update system
apt-get update && apt-get --yes upgrade
apt-get --yes install apt-transport-https
apt-get --yes --force-yes dist-upgrade

# Download and add apt keys
wget -q https://nginx.org/keys/nginx_signing.key -O- | apt-key add -
wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add -

# Download apt sources
mkdir -p /etc/apt/sources.list.d
cd /etc/apt/sources.list.d
wget -q https://raw.githubusercontent.com/99stack/installer/master/debian-latest/nginx-with-php-fpm/web.list

# Install packages
apt-get update && apt-get --yes install nginx php-fpm haproxy curl fail2ban

# Create nginx config dirs
mkdir -p /etc/nginx/conf.d
mkdir -p /etc/nginx/sites-available
mkdir -p /etc/nginx/sites-enabled

# Download nginx config
cd /etc/nginx && rm nginx.conf
wget -q https://raw.githubusercontent.com/99stack/installer/master/debian-latest/nginx-with-php-fpm/nginx.conf

# Restart nginx webserver
systemctl restart nginx

# Cleanup 
apt-get --yes autoremove
