#!/bin/bash

# Update all packages in current system to latest available 
sudo apt-get update && sudo apt-get upgrade -y

# Change sources from "stretch" (9) to "buster" (10)
sudo sed -i 's/stretch/buster/g' /etc/apt/sources.list

# Upgrade to Debian 10
sudo apt-get update && sudo apt-get upgrade -y

# Run dist-upgrade to resolve remaining dependencies
sudo apt-get dist-upgrade
