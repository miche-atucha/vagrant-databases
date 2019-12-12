#!/bin/bash

echo " "
echo "===================================================="
echo "Testing MongoDB..."
echo " "
mongo --eval 'db.runCommand({ connectionStatus: 1 })'

echo " "
echo "===================================================="
echo "Testing Redis..."
echo " "
sudo systemctl status redis

echo " "
echo "===================================================="
echo "Listening on IP: 1.1.1.10"
echo "MongoDB at PORT: 27017"
echo "Redis at PORT: 6379"
echo "===================================================="
echo " "
