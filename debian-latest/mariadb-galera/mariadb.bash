#!/bin/bash

# Add repository for mariadb 10.5
sudo apt-get install software-properties-common dirmngr
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
sudo add-apt-repository 'deb [arch=amd64] https://mirrors.nxthost.com/mariadb/repo/10.5/debian buster main'

# Install mariadb server plus galera
sudo apt-get update && sudo apt-get install mariadb-server -y

# Change bind adress to 0.0.0.0 for global access 
# TODO: update config
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf

# Update encoding to UTF-8
cd /etc/mysql
sudo wget https://raw.githubusercontent.com/99stack/installer/master/debian-latest/mariadb-galera/mariadb.cnf

# Run secure installation
sudo mysql_secure_installation

# Stop mariadb service
sudo systemctl stop mariadb

# Download and install galera.cnf
cd /etc/mysql/conf.d
sudo wget https://raw.githubusercontent.com/99stack/installer/master/debian-latest/mariadb-galera/galera.cnf

# Finishing up, to start a new cluster, run:    sudo galera_new_cluster
