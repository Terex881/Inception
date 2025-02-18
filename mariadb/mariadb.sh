#!/bin/bash

service mariadb start 

sleep 5

mariadb -e "CREATE DATABASE hello_db;"
mariadb -e "CREATE USER 'terex'@'%' IDENTIFIED BY 'zxcvbnm';"
mariadb -e "GRANT ALL ON hello_db.* TO 'terex'@'%' IDENTIFIED BY 'zxcvbnm';"
mariadb -e "FLUSH PRIVILEGES;"

# mysqladmin -uroot -psalah shutdown
service mariadb stop
exec mysqld_safe --bind-address=0.0.0.0