#!/bin/bash

echo "Installing Postgres..."
sudo apt-get update
sudo apt-get install -y postgresql postgresql-contrib
sudo -u postgres psql -c "CREATE USER admin WITH SUPERUSER CREATEDB ENCRYPTED PASSWORD 'admin'"
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/10/main/postgresql.conf
sudo sed -i "s/host    replication     all             127.0.0.1\/32            md5/host    all             all             all                     md5/" /etc/postgresql/10/main/pg_hba.conf
sudo /etc/init.d/postgresql restart
