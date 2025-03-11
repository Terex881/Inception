FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server vim 

#remove  vim

COPY mariadb.sh /mariadb.sh

RUN chmod +x ./mariadb.sh  

ENTRYPOINT [ "bash", "/mariadb.sh" ]