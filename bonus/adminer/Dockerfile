FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y adminer

RUN cp /usr/share/adminer/adminer.php /usr/share/adminer/index.php

ENTRYPOINT ["php", "-S", "0.0.0.0:8000", "-t", "/usr/share/adminer/"]