#!/bin/bash

service mariadb start 

sleep 5  

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQLDB}\`;"
mariadb -e "CREATE USER IF NOT EXISTS '${MYSQLUSER}'@'%' IDENTIFIED BY '${MYSQLPASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQLDB}\`.* TO '${MYSQLUSER}'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

mariadb-admin shutdown

# exec mysqld_safe --bind-address=0.0.0.0
mysqld_safe --bind-address=0.0.0.0