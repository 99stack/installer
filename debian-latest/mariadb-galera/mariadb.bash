#!/bin/bash

# Using Debian 10 default repo 10.3
#sudo apt-get install software-properties-common dirmngr -y
#sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
#sudo add-apt-repository 'deb [arch=amd64] https://mirrors.nxthost.com/mariadb/repo/10.5/debian buster main'

# Install mariadb server plus galera
sudo apt-get update && sudo apt-get install mariadb-server -y

# Run secure installation
sudo mysql_secure_installation

# Download and install galera.cnf
cd /etc/mysql/mariadb.conf.d
sudo rm 60-galera.cnf
sudo wget https://raw.githubusercontent.com/99stack/installer/master/debian-latest/mariadb-galera/60-galera.cnf

# Finishing up, to start a new cluster, run:    sudo galera_new_cluster
# Then restart the server and let other nodes connect.
