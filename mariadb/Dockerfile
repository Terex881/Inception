FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y mariadb-server vim 

#remove  vim

COPY mariadb.sh /mariadb.sh

RUN chmod +x ./mariadb.sh  

ENTRYPOINT [ "bash", "/mariadb.sh" ]