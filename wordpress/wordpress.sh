#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

WP_PATH=/var/www/wordpress

wp core download --path=$WP_PATH --allow-root

mv $WP_PATH/wp-config-sample.php $WP_PATH/wp-config.php

wp user create --allow-root terex 1337@gmail.com --user_pass=zxcvbnm  --path=$WP_PATH
wp config create --allow-root --dbname=hello_db --dbuser=terex --dbpass=zxcvbnm  --path=$WP_PATH

wp core install --allow-root --url=sdemnati.42.fr --title="WELCOME" --admin_user=terex --admin_password=zxcvbnm --admin_email=1337@gmail.com  --path=$WP_PATH

/usr/sbin/php-fpm7.4 -F