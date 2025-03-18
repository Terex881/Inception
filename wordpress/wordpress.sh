#!/bin/bash
sleep 10

mkdir -p /var/www/wordpress

MYSQL_PASSWORD=$(cat /run/secrets/db_password)
WA_PASS=$(cat /run/secrets/wp_admin_password)
NW_PASS=$(cat /run/secrets/wp_user_password)

cd /var/www/wordpress && rm -rf *
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp && chmod -R 777 /var/www/wordpress/
wp core download --allow-root
mv /var/www/wordpress/wp-config-sample.php  /var/www/wordpress/wp-config.php
wp config set --allow-root DB_NAME ${MYSQLDB} 
wp config set --allow-root DB_USER ${MYSQL_USER}
wp config set --allow-root DB_PASSWORD ${MYSQL_PASSWORD}
wp config set --allow-root DB_HOST ${MYSQLHOST}

wp core install --url=$W_DN --title=$W_TITLE --admin_user=$WA_NAME --admin_password=$WA_PASS --admin_email=$WA_EMAIL --allow-root 
wp user create ${NW_USER} ${NW_EMAIL} --user_pass=$NW_PASS --role=$NW_ROLE --allow-root

wp config set --allow-root WP_REDIS_HOST ${WP_REDIS_HOST}
wp config set --allow-root WP_REDIS_PORT ${WP_REDIS_PORT}
wp config set --allow-root WP_CACHE ${WP_CACHE}
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

sed -i '36s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
exec php-fpm7.4 -F