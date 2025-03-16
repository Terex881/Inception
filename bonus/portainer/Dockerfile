FROM debian:bullseye

# Install prerequisites
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y wget tar

# Download and extract Portainer
RUN mkdir -p /opt/portainer && \
    wget -q https://github.com/portainer/portainer/releases/download/2.19.4/portainer-2.19.4-linux-amd64.tar.gz -O /opt/portainer.tar.gz && \
    tar -xzf /opt/portainer.tar.gz -C /opt/portainer --strip-components=1 && \
    rm /opt/portainer.tar.gz


WORKDIR /opt/portainer

ENTRYPOINT ["/opt/portainer/portainer"]