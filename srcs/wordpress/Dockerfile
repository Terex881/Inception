# FROM debian:bullseye

# RUN apt-get update -y && apt-get upgrade -y && \
#     apt install -y curl  php php-fpm php-mysql

# COPY wordpress.sh /wordpress.sh

# RUN chmod +x /wordpress.sh

# ENTRYPOINT ["./wordpress.sh"]


FROM debian:bullseye

RUN apt update  &&  apt install -y curl git wget php php-fpm php-mysql 

COPY wordpress.sh /wordpress.sh

RUN chmod +x /wordpress.sh

WORKDIR /var/www/wordpress

RUN mkdir -p /run/php

ENTRYPOINT [ "bash", "/wordpress.sh" ]