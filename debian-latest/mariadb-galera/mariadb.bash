#!/bin/bash

# Add repository for mariadb 10.4
sudo apt-get install software-properties-common dirmngr
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
sudo add-apt-repository 'deb [arch=amd64] http://ams2.mirrors.digitalocean.com/mariadb/repo/10.4/debian buster main'

# Install mariadb server plus galera
sudo apt-get update && sudo apt-get -y install mariadb-server mariadb-client

# Change bind adress to 0.0.0.0 for global access 
# TODO: update config
sed -i 's/bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# Stop mariadb service
sudo systemctl stop mariadb

# Download and install galera.cnf
cd /etc/mysql/conf.d
sudo wget https://raw.githubusercontent.com/99stack/installer/master/debian-latest/mariadb-galera/galera.cnf

# Finishing up, to start a new cluster, run:    sudo galera_new_cluster
