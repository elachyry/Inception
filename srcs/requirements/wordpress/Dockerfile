FROM debian:11

RUN apt update -y  && apt install -y wget php php7.4-fpm php-mysql mariadb-client php-redis

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

COPY /tools/script.sh /
RUN chmod +x script.sh
CMD ["/script.sh"]