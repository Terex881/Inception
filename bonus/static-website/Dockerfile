FROM debian:bullseye

RUN apt-get update && apt-get install -y nodejs npm && npm install -g http-server

WORKDIR /var/www/html

COPY static-website.html index.html

ENTRYPOINT ["http-server", "-p", "8080"]