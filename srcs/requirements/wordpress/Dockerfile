FROM debian:bullseye

RUN apt update && apt install -y curl git wget php php-fpm php-mysql vim 

#remove  vim

COPY tools/wordpress.sh /wordpress.sh

RUN chmod +x /wordpress.sh

WORKDIR /var/www/wordpress

RUN mkdir -p /run/php

ENTRYPOINT [ "bash", "/wordpress.sh" ]