#!/bin/bash

# Ask for size in MB
read -p "Enter swap size in MB: " swap_s

# Convert from B to MB
let "swap_size = $swap_s * 1024"

# Print size
echo "Swap size: $swap_size KB"

# Setup a swap space
sudo dd if=/dev/zero of=/root/swap.img bs=1024 count=$swap_size
sudo chmod 600 /root/swap.img
sudo mkswap /root/swap.img
sudo swapon /root/swap.img
