#!/bin/bash
set -x
set -e

# set variables. Wordpress needs these variables set to start
export WORDPRESS_DB_HOST=127.0.0.1
export WORDPRESS_DB_USER=user1
export WORDPRESS_DB_PASSWORD=password
export WORDPRESS_DB_NAME=localdemostore

# update config for MariaDB to be able to connect to it from host
sed -i "s/bind-address.*/bind-address = 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# Start MariaDB service
service mariadb start

# Create a new MariaDB database and user for WordPress
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';"

# add password for root user
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;"
mysql -uroot -e " FLUSH PRIVILEGES;"

echo "====================================="
echo "MYSQL USERS"
echo "username=root, password=password"
echo "username=user1, password=password"
echo "====================================="

echo  "Starting WordPress.."
docker-entrypoint.sh apache2-foreground
