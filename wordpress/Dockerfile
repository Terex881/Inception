FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && \
apt install -y curl git wget  php php-fpm php-mysql

COPY wordpress.sh /wordpress.sh

# WORKDIR /var/www/wordpress/

RUN chmod +x /wordpress.sh

ENTRYPOINT ["./wordpress.sh"]
