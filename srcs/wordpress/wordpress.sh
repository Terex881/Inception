# #!/bin/bash

# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# chmod +x wp-cli.phar

# mv wp-cli.phar /usr/local/bin/wp

# mkdir -p /var/www/wordpress

# cd /var/www/wordpress

# # Download WordPress core
# wp core download --allow-root

# # Configure database connection before user creation
# mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

# wp config create --allow-root --dbname="hello_db" --dbuser="terex" --dbpass="zxcvbnm"

# # Install WordPress
# wp core install --allow-root \
#   --url="sdemnati.42.fr" \
#   --title="WELCOME" \
#   --admin_user="terex" \
#   --admin_password="zxcvbnm" \
#   --admin_email="1337@gmail.com" \
#   --path=/var/www/wordpress


# sed -i 's|^listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

# # Start PHP-FPM in the foreground
# exec php-fpm7.4 -F



#!/bin/bash

echo "Waiting for 10 seconds..."
sleep 10

echo "Creating WordPress directory at /var/www/wordpress..."
mkdir -p /var/www/wordpress

cd /var/www/wordpress

echo "Removing any existing files in the WordPress directory..."
rm -rf *

echo "Downloading wp-cli.phar..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar  

echo "Making wp-cli.phar executable..."
chmod +x wp-cli.phar

echo "Moving wp-cli.phar to /usr/local/bin/wp..."
mv wp-cli.phar /usr/local/bin/wp

echo "Setting permissions on the WordPress directory..."
chmod -R 777 /var/www/wordpress/

echo "Downloading the WordPress core files..."
wp core download --allow-root

echo "Renaming wp-config-sample.php to wp-config.php..."
mv /var/www/wordpress/wp-config-sample.php  /var/www/wordpress/wp-config.php

echo "Configuring database settings..."
wp config set --allow-root DB_NAME ${MYSQLDB} 
wp config set --allow-root DB_USER ${MSQLUSER}
wp config set --allow-root DB_PASSWORD ${MYSQLPASSWORD}
wp config set --allow-root DB_HOST "mariadb:3306"

echo "Installing WordPress..."
wp core install --url=$W_DN --title=$W_TITLE --admin_user=$W_A_N --admin_password=$W_A_P --admin_email=$W_E_A --skip-email --allow-root 

# echo "Creating a new WordPress user..."
# wp user create ${N_W_USER} ${N_W_EMAIL} --user_pass=$N_W_PASS --role=$N_W_ROLE --allow-root

echo "Configuring Redis Cache..."
wp config set WP_CACHE true --allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root

echo "Installing and activating Redis Cache plugin..."
wp plugin install redis-cache --activate --allow-root

echo "Enabling Redis Cache..."
wp redis enable --allow-root

echo "Updating PHP-FPM configuration..."
sed -i 's|^listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

echo "Starting PHP-FPM in the foreground..."
php-fpm7.4 -F