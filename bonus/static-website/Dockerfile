FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y php

WORKDIR /var/www/html

COPY static-website.html /var/www/html/index.html

ENTRYPOINT ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]
