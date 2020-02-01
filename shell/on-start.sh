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
systemctl status redis

echo " "
echo "===================================================="
echo "Testing MySQL..."
echo " "
systemctl status mysql.service

echo " "
echo "===================================================="
echo "Testing Postgres..."
echo " "
systemctl status postgresql

echo " "
echo "===================================================="
echo "Listening on IP: 1.1.1.10"
echo "MongoDB at PORT: 27017"
echo "Redis at PORT: 6379"
echo "MySQL at PORT: 3306"
echo "Postgres at PORT: 5432"
echo "===================================================="
echo " "
