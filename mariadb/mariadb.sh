#!/bin/bash

service mariadb start 
sleep 5  

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQLDB}\`;"
mariadb -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQLDB}\`.* TO '${MYSQL_USER}'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop
exec mysqld_safe --bind-address=0.0.0.0