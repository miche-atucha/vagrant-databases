#!/bin/bash

echo "Installing MySQL..."
apt install -y mysql-server
sudo sed -i "s/.*bind-address.*/bind-address            = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
mysql --user=root <<_EOF_
UPDATE mysql.user SET authentication_string=PASSWORD("root") WHERE User='root';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
_EOF_
mysql --user=root <<_EOF_
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
_EOF_
sudo systemctl restart mysql
