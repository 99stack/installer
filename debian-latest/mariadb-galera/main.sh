#!/bin/bash

# Update and install mariadb latest version
apt-get update && apt-get upgrade --yes
apt-get install --yes mariadb-server mariadb-client rsync nload htop

# Change bind adress to 0.0.0.0 for global access
sed -i 's/bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# Setup a 2GB swap space
dd if=/dev/zero of=/root/swap.img bs=1024 count=2097152
chmod 600 /root/swap.img
mkswap /root/swap.img
swapon /root/swap.img

# Download and install galera.cnf
cd /etc/mysql/conf.d
wget https://raw.githubusercontent.com/99stack/installer/master/debian-latest/mariadb-galera/galera.cnf
