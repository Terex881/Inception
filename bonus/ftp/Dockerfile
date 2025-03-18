FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y vsftpd

COPY ./ftp.sh /ftp.sh

RUN chmod +x /ftp.sh

ENTRYPOINT ["/ftp.sh"]