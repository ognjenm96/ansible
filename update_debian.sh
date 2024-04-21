#!/bin/bash
# System update script
sudo apt-get update
echo "Pulling updates..."
echo "*************************************************************************************"
echo "List of upgradable pakets: "
sudo apt list --upgradable
echo "*************************************************************************************"
echo "Enter the paket you want to upgrade: "
read paket
sudo apt-get install $paket