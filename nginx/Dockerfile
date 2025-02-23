FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y nginx

COPY nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]