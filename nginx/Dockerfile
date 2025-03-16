FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl && \
    openssl req -x509 -newkey rsa:4096 \
    -keyout /etc/nginx/ssl/my.key \
    -out /etc/nginx/ssl/cert.crt -sha256 \
    -days 365 -nodes -subj="/CN=sdemnati.42.fr"

COPY nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]