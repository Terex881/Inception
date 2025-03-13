FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y redis

COPY redis.sh /redis.sh

RUN chmod +x /redis.sh

ENTRYPOINT ["bash", "/redis.sh" ]