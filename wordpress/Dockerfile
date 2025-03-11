FROM debian:bullseye

RUN apt update && apt install -y curl wget php php-fpm php-mysql vim 

#remove  vim

COPY wordpress.sh /wordpress.sh

RUN chmod +x /wordpress.sh

WORKDIR /var/www/wordpress

RUN mkdir -p /run/php

# CMD ["./wordpress.sh"]
ENTRYPOINT ["bash", "/wordpress.sh" ]