FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y redis

ENTRYPOINT ["redis-server", "--protected-mode", "no", "--maxmemory", "500mb", "--maxmemory-policy", "allkeys-lru"]
#least recently used