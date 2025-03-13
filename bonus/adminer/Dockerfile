FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y php wget

RUN mkdir -p /var/www/html

RUN wget "https://www.adminer.org/latest.php" -O /var/www/html/adminer.php

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]
