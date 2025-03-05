FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y nginx vim openssl

# Remove VIM

RUN mkdir /cert && openssl req -x509 -newkey rsa:4096 \
                -keyout /cert/my.key -out /cert/cert.crt \
                -sha256 -days 365 -nodes \
                -subj="/CN=sdemnati.42.fr"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]