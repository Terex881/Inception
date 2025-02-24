#!/bin/bash

# Download WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/wordpress

cd /var/www/wordpress

# Download WordPress core
wp core download --allow-root

# Configure database connection before user creation
mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

wp config create --allow-root --dbname=hello_db --dbuser=terex --dbpass=zxcvbnm

# Install WordPress
wp core install --allow-root \
  --url=sdemnati.42.fr \
  --title="WELCOME" \
  --admin_user=terex \
  --admin_password=zxcvbnm \
  --admin_email=1337@gmail.com \
  --path=/var/www/wordpress


sed -i 's|^listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

# Start PHP-FPM in the foreground
exec php-fpm7.4 -F
