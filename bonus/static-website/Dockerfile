FROM debian:bullseye

RUN apt-get-get update && apt-get-get upgrade -y && apt-get-get install -y php

WORKDIR /var/www/html

COPY static-website.html /var/www/html/index.html

ENTRYPOINT ["php", "-S", "0.0.0.0:8000", "-t", "/var/www/html"]
