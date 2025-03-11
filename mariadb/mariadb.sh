#!/bin/bash

echo "Starting MariaDB service..."
service mariadb start 

echo "Waiting 5 seconds for database initialization..."
sleep 5  

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQLDB}\`;"
mariadb -e "CREATE USER IF NOT EXISTS '${MYSQLUSER}'@'%' IDENTIFIED BY '${MYSQLPASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQLDB}\`.* TO '${MYSQLUSER}'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

echo "Stopping MariaDB service..."
service mariadb stop

echo "Starting MariaDB in safe mode, allowing remote connections..."
exec mysqld_safe --bind-address=0.0.0.0