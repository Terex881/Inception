FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y wget tar

RUN mkdir -p /opt/portainer && \
    wget -q https://github.com/portainer/portainer/releases/download/2.19.4/portainer-2.19.4-linux-amd64.tar.gz -O /opt/portainer.tar.gz && \
    tar -xzf /opt/portainer.tar.gz -C /opt/portainer --strip-components=1 && \
    rm /opt/portainer.tar.gz

ENTRYPOINT ["/opt/portainer/portainer"]