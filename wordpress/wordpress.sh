#!/bin/bash

# Remove existing WordPress files (optional, but careful)
rm -rf /var/www/wordpress/*

# Ensure the WordPress directory exists
mkdir -p /var/www/wordpress
cd /var/www/wordpress || exit

# Download WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Download WordPress
wp core download --allow-root

# Create wp-config.php
wp config create --allow-root --dbname=hello_db --dbuser=terex --dbpass=zxcvbnm --dbhost=mariadb

# Install WordPress
wp core install --allow-root --url=sdemnati.42.fr --title="WELCOME" \
    --admin_user=terex --admin_password=zxcvbnm --admin_email=1337@gmail.com

# Create a user
wp user create --allow-root terex 1337@gmail.com --user_pass=zxcvbnm --role=administrator

# Change ownership of WordPress files
chown -R www-data:www-data /var/www/wordpress
chmod -R 755 /var/www/wordpress

# Keep the container running
php-fpm -F

# # rm -rf /var/www/wordpress/*

# mkdir -p /var/www/wordpress


# cd /var/www/wordpress

# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# chmod +x wp-cli.phar

# mv wp-cli.phar /usr/local/bin/wp

# # chmod -R 777 

# wp core download --allow-root
# # wp core download

# wp user create --allow-root terex 1337@gmail.com --user_pass=zxcvbnm
# wp config create --allow-root --dbname=hello_db --dbuser=terex --dbpass=zxcvbnm

# wp core install --allow-root --url=sdemnati.42.fr --title="WELCOME" --admin_user=terex --admin_password=zxcvbnm --admin_email=1337@gmail.com
# chown -R www-data:www-data /var/www/wordpress

# # chmod -R 755 /var/www/wordpress

# php-fpm -F