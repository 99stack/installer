#!/bin/bash

# Uninstall mariadb server and client
sudo apt-get purge mariadb-server mariadb-client -y

# Remove unused packages
sudo apt-get autoremove -y

# Remove config files
sudo rm -r /var/lib/mysql
sudo rm -r /etc/mysql
