#!/bin/bash

echo "Installing MongoDB..."
apt install -y mongodb
sudo sed -i 's/bind_ip = 127.0.0.1/bind_ip = 0.0.0.0/' /etc/mongodb.conf
sudo systemctl restart mongodb
