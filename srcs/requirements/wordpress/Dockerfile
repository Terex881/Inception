FROM debian:bullseye

RUN apt-get update && apt-get install -y curl wget php php-fpm php-mysql

COPY ./tools/wordpress.sh /wordpress.sh

RUN chmod +x /wordpress.sh

WORKDIR /var/www/wordpress

RUN mkdir -p /run/php

ENTRYPOINT ["/wordpress.sh"]