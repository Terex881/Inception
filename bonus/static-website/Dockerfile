FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y php

WORKDIR /var/www/html

COPY static-website.html /var/www/html/index.html

EXPOSE 8000

ENTRYPOINT ["php", "-S", "0.0.0.0:8000", "-t", "/var/www/html"]
