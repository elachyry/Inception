from debian:11

RUN apt update -y && apt install -y php wget php-mysql

WORKDIR /var/www/adminer

RUN wget https://www.adminer.org/latest.php -O index.php

CMD ["php", "-S", "0.0.0.0:8000", "-t", "/var/www/adminer"]

